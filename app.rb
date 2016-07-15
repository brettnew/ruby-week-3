require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  erb(:index)
end

get('/stylists/view') do
 @stylists= Stylist.all()
 erb(:stylist)
end

get('/stylists') do
  @stylists = Stylist.all()
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

get('/clients/view') do
  @clients = Client.all()
  erb(:client)
end

get('/clients') do
  @clients = Client.all()
  erb(:client)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @clients = Client.all()
  erb(:stylist_client)
end

get('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @client.save()
  @clients = Client.all
  @stylist = Stylist.all()
  erb(:client)
end

post('/clients/add_stylist') do
  name = params.fetch('client_name')
  phone = params.fetch('phone_number')
  email = params.fetch('email')
  stylist_id = params.fetch('stylist_id').to_i()
  client = Client.new({:name => name, :stylist_id => stylist_id, :phone => phone, :email => email})
  client.save()
  @client = client
  @clients = Client.all()
  erb(:stylist_client)
end
