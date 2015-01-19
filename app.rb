require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/phone')

get('/') do
	@contacts = Contact.all()
  erb(:index)	
end

post('/') do
  contact_name = params.fetch('contact_name')
  @contact = Contact.new(contact_name)
  @contact.save()
  @contacts = Contact.all()
  erb(:index)
end

post('/phones') do
  home_phone = params.fetch('home_phone')
  cell_phone = params.fetch('cell_phone')
  work_phone = params.fetch('work_phone')
  @phones = Phone.new(home_phone, cell_phone, work_phone)
  @phones.save()
  @contact = Contact.find(params.fetch('contact_id').to_i())
  @contact.add_phone_numbers(@phones)
  erb(:contact_details)
end

get('/contact_details/:id') do
  @contact = Contact.find(params.fetch("id"))
  erb(:contact_details)
end

get('/clear_contacts') do
  @contacts = Contact.all()
  Contact.all().clear()
  erb(:index)
end