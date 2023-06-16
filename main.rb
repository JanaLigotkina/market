require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
require_relative 'lib/album'
require_relative 'lib/productcollection'

sum = 0
basket = []
user_answer = nil
collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

# Выводим актуальный список товаров 
def product_collection_actually(collection)
	
	# TODO: Вроде можно не повторять много раз `index + 1`, а сразу сделать его на 1 больше в аргументах

	collection.to_a.each_with_index do |product, index|
		puts "#{index + 1}. #{product}"
		puts "#{index + 1 - collection.to_a.size}. Выход" if (index + 1) == collection.to_a.size
	end 
end 	

# Если выбрали товар, то нужно уменьшить количество на 1 
def update_amount_collection(index, collection)
	collection.to_a[index].amount -= 1
end 	


until user_answer == 0 do 
	puts "Что хотите купить:"
	product_collection_actually(collection)

	user_answer = gets.to_i
	index = user_answer - 1

	if index != -1
		puts collection.to_a[index] 
		basket << collection.to_a[index]
	    sum += collection.to_a[index].price
	    update_amount_collection(index, collection)   # запускаем функцию обновления количества товаров
	end     
end

puts "Вы купили:"

basket.each do |product| 
	puts product
end	

puts "С Вас — #{sum} руб. Спасибо за покупки!"

