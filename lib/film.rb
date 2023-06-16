require_relative 'product'

class Film < Product
	attr_accessor :name, :year, :director

	def self.from_file(file_path)
    	if File.exist?(file_path)
            f = File.new(file_path, "r:UTF-8")
            lines = f.readlines(chomp: true)
            f.close
            self.new(
  				name: lines[0], year: lines[2], director: lines[1], price: lines[3].to_i, amount: lines[4].to_i
			)
        else
            puts "Файл не найден"
        end	
    end

	def initialize(params)
		super
        @name = params[:name]
        @year = params[:year]
        @director = params[:director]
    end

    def to_s 
        return "Фильм #{@name}, #{@year}, реж. #{@director}, #{super}"
    end

    def update(params)
    	super

        @name = params[:name] if params[:name]
        @year = params[:year] if params[:year]
        @director = params[:director] if params[:director]
    end 
end 	