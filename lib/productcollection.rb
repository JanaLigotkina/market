class ProductCollection
  
  PRODUCT_TYPES = {
  	album: {dir: 'album', class: Album},
    film: {dir: 'films', class: Film},
    book: {dir: 'books', class: Book}
  }
  
  def initialize(products = [])
    @products = products
  end

  # TODO: Это тоже следует вынести в `Helper`

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]
	  product_class = hash[:class]

      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|
        products << product_class.from_file(path)
      end
    end

    self.new(products)
  end

  def to_a
    @products
  end

  def sort!(params)
    # Делает выбор по параметру by
    case params[:by]

    # TODO: Когда будет повяляться новые поля для сортировки, придется добавлять их здесь снова и снова
    # Следует сделать так, чтобы тебе не нужно было указчать `:title, :price, ...`

    when :title
      # Если запросили сортировку по наименованию
      @products.sort_by! { |product| product.to_s }
    when :price
      # Если запросили сортировку по цене
      @products.sort_by! { |product| product.price }
    when :amount
      # Если запросили сортировку по количеству
      @products.sort_by! { |product| product.amount }
    end

    # Если запросили сортировку по возрастанию
    @products.reverse! if params[:order] == :asc

    self
  end
end
