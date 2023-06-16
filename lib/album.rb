require_relative 'product'

class Album < Product
	attr_accessor :name, :genre, :autor, :year


    # TODO: Эту функцию сделует вынести в отдельный класс `Helper` и подключать там где это требуется

	def self.from_file(file_path)
    	if File.exist?(file_path)
            f = File.new(file_path, "r:UTF-8")
            lines = f.readlines(chomp: true)
            f.close
            self.new(
  				name: lines[0], genre: lines[2], autor: lines[1], year: lines[3], price: lines[4].to_i, amount: lines[5].to_i
			)
        else
            puts "Файл не найден"
        end	
    end

	def initialize(params)
		super
        @name = params[:name]
        @autor = params[:autor]
        @genre = params[:genre]
        @year = params[:year]
    end

    def to_s 
        "Альбом #{@autor} - #{@name}, #{@genre}, #{@year}, #{super}"
    end

    def update(params)
    	super

        @name = params[:name] if params[:name]
        @genre = params[:genre] if params[:genre]
        @autor = params[:autor] if params[:autor]
        @year = params[:year] if params[:year]
    end  
end 	