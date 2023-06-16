class Product
	attr_accessor :price, :amount

	def initialize(params)
        @price = params[:price]
        @amount = params[:amount]
    end

    def to_s 
        "#{@price} руб. (осталось #{@amount})"
    end   

    def update(params)
        # TODO: Эти операции нужно вынести в отдельный класс `Helper`, чтоб писать что-то вроде `Helper.attr_update(price)`

        @price = params[:price] if params[:price]
        @amount = params[:amount] if params[:amount]
    end  

    def self.from_file(file_path)
        raise NotImplementedError
    end
end	
