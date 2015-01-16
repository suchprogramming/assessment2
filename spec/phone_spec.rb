require('rspec')
require('phone')
require('contact')

describe(Contact) do 
	
	before() do
	 	Contact.clear()
	end

	describe("#phone_number") do
    it("returns the phone number of an object") do
      test_contact = Contact.new({:contact_name => "Tyler", :phone_number => 1234567890})
      expect(test_contact.phone_number()).to(eq(1234567890))
    end
	end

	describe("#contact_name") do
    it("returns an object's contact name") do
      test_contact = Contact.new({:contact_name => "Tyler", :phone_number => 1234567890})
      expect(test_contact.contact_name()).to(eq("Tyler"))
    end
	end

	describe("#save") do
    it("pushes saved contacts to the main array") do
      test_contact = Contact.new({:contact_name => "Tyler", :phone_number => 1234567890})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
	end

	describe(".all") do
		it("holds all contacts eventually, begins empty") do
      expect(Contact.all()).to(eq([]))
    end
	end

	describe(".clear") do
		it("empties the saved contact list") do
			Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
	end
end


