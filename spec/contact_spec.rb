require('rspec')
require('phone')
require('contact')

describe(Contact) do 
	
	before() do
	 	Contact.clear()
	end

	describe("#contact_name") do
    it("returns an object's contact name") do
      test_contact = Contact.new("Tyler")
      expect(test_contact.contact_name()).to(eq("Tyler"))
    end
	end

	describe("#save") do
    it("pushes saved contacts to the main array") do
      test_contact = Contact.new("Tyler")
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
	end

  describe("#add_phone_numbers") do
    it("adds a phone number object to the contact instance") do
      test_contact = Contact.new("Tyler")
      test_numbers = Phone.new(1234567890, 1234567890, 1234567890)
      test_contact.add_phone_numbers(test_numbers)
      expect(test_contact.phone_numbers()).to(eq([test_numbers]))
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

	describe(".id") do
    it("assigns a unique id to each contact") do
      test_contact1 = Contact.new("Tyler")
      test_contact1.save()
      test_contact2 = Contact.new("Becky")
      test_contact2.save()
      expect(test_contact2.id()).to(eq(2))
    end
	end

	describe(".find") do
    it("finds a contact according to its assigned id number") do
      test_contact1 = Contact.new("Tyler")
      test_contact1.save()
      test_contact2 = Contact.new("Becky")
      test_contact2.save()
      expect(Contact.find(test_contact1.id())).to(eq(test_contact1))
    end
	end
end


