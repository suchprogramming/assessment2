require('rspec')
require('phone')
require('contact')

describe(Phone) do

  before() do
    Phone.clear()
  end

  describe(".all") do
    it("holds all contacts eventually, begins empty") do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties the saved contact list") do
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a phone number to the all phone numbers object") do
      test_phone = Phone.new(1234567890, 1234567890, 1234567890)
      test_phone.save()
      expect(Phone.all()).to(eq([test_phone]))
    end
  end
end