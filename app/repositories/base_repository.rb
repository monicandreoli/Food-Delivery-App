require 'csv'

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  def create(new)
    new.id = @next_id
    @elements << new
    @next_id += 1
    save_csv
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << csv_header
      @elements.each do |element|
        csv << csv_row(element)
      end
    end 
  end

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file, csv_options) do |row|
      build_element(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end