require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'hair_salon'})

get('/') do
  erb(:index)
end

get('/stylists/view') do
 @stylists= Stylist.all()
 erb(:stylist)
end

post('/stylists') do
  name = params.fetch('stylist_name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylist = stylist
  @stylists = Stylist.all()
  erb(:stylist)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @clients = Client.all()
  erb(:stylist_client)
end

post('/clients/add_stylist') do
  name = params.fetch('client_name')
  phone = params.fetch('phone_number')
  email = params.fetch('email')
  stylist_id = params.fetch('stylist_id').to_i()
  client = Client.new({:name => name, :stylist_id => stylist_id, :phone => phone, :email => email, :id => nil})
  client.save()
  @client = client
  @clients = Client.all()
  erb(:client)
end

get('/clients/view') do
  @clients = Client.all()
  erb(:client)
end

get('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @clients = Client.all
  @stylists = Stylist.all()
  erb(:client_info)
end

delete('/stylists/delete') do
  @stylist = Stylist.find(params.fetch('stylist_id').to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylist)
end

delete('/clients/delete') do
  @client = Client.find(params.fetch('client_id').to_i())
  @client.delete()
  @clients = Client.all()
  erb(:client)
end

patch('/stylists/update/:id') do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:stylist_success)
end

patch('/clients/update/:id') do
  phone = params.fetch("phone")
  email = params.fetch("email")
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:phone => phone, :email => email})
  erb(:client_info)
end
