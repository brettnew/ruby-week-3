require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/stylists') do
  name = params.fetch('stylist_name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylist = stylist
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @clients = Client.all()
  erb(:stylist)
end
