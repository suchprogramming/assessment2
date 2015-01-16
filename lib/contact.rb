class Contact

	@@contact_list = []

  attr_reader(:contact_name, :phone_number)

  define_method(:initialize) do |attributes|
    @contact_name = attributes.fetch(:contact_name)
    @phone_number = attributes.fetch(:phone_number)
  end

  define_method(:save) do
    @@contact_list.push(self)
  end

  define_singleton_method(:clear) do
    @@contact_list = []
  end

  define_singleton_method(:all) do
    @@contact_list
  end

end




	