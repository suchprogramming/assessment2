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
  @contact_name = params.fetch('contact_name')
  @phone_number = params.fetch('phone_number')
  @contact = Contact.new({ :contact_name => @contact_name, :phone_number => @phone_number })
  @contact.save()
  @contacts = Contact.all()
  erb(:index)
end

get('/contact_details/:id') do
  @contact = Contact.find(params.fetch("id"))
  erb(:contact_details)
end