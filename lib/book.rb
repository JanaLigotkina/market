require_relative 'product'

class Book < Product
	attr_accessor :name, :genre, :autor

	def self.from_file(file_path)
    	if File.exist?(file_path)
            f = File.new(file_path, "r:UTF-8")
            lines = f.readlines(chomp: true)
            f.close
            self.new(
  				name: lines[0], genre: lines[1], autor: lines[2], price: lines[3].to_i, amount: lines[4].to_i
			)
        else
            puts "Файл не найден"
        end	
    end

	def initialize(params)
		super
        @name = params[:name]
        @genre = params[:genre]
        @autor = params[:autor]
    end

    def to_s 
        "Книга #{@name}, #{@genre}, автор - #{@autor}, #{super}"
    end

    def update(params)
    	super

        @name = params[:name] if params[:name]
        @genre = params[:genre] if params[:genre]
        @autor = params[:autor] if params[:autor]
    end  
end 	