class Phone

  @@all_phone_numbers = []

  attr_reader(:home_phone, :cell_phone, :work_phone)

  define_method(:initialize) do |home_phone, cell_phone, work_phone|
    @home_phone = home_phone
    @cell_phone = cell_phone
    @work_phone = work_phone
  end

  define_singleton_method(:all) do
    @@all_phone_numbers
  end

  define_singleton_method(:clear) do
    @all_phone_numbers = []
  end

  define_method(:save) do
    @@all_phone_numbers.push(self)
  end
end