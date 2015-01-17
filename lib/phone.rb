class Phone

  attr_reader(:home_phone, :cell_phone)

  define_method(:initialize) do |attributes|
    @home_phone = attributes.fetch(:home_phone)
    @cell_phone = attributes.fetch(:cell_phone)
  end

end
