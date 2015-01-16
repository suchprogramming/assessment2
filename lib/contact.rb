class Contact

	@@contact_list = []

  attr_reader(:contact_name, :phone_number)

  define_method(:initialize) do |attributes|
    @contact_name = attributes.fetch(:contact_name)
    @phone_number = attributes.fetch(:phone_number)
    @contact_id = @@contact_list.length().+(1)
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




	