class Contact

	@@contact_list = []

  attr_reader(:contact_name, :phone_numbers)

  define_method(:initialize) do |contact_name|
    @contact_name = contact_name
    @phone_numbers = []
    @contact_id = @@contact_list.length().+(1)
  end

  define_method(:save) do
    @@contact_list.push(self)
  end

  define_method(:add_phone_numbers) do |number_group|
    @phone_numbers.push(number_group)
  end

  define_singleton_method(:clear) do
    @@contact_list = []
  end

  define_singleton_method(:all) do
    @@contact_list
  end

  define_method(:id) do
    @contact_id
  end

  define_singleton_method(:find) do |get_contact|
  	matched_contact = nil
  	@@contact_list.each() do |contact|
  		if contact.id.eql?(get_contact.to_i())
  			matched_contact = contact
  		end
  	end
  	matched_contact
  end
end




	