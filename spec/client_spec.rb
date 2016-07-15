require('spec_helper')

describe(Client) do
  describe('#name') do
    it('will tell you the name of the client') do
      client = Client.new({:name => "Mary", :stylist_id => 1})
      expect(client.name()).to(eq("Mary"))
    end
  end

  describe('#stylist_id') do
    it('will give you the stylist_id of the client') do
      client = Client.new({:name => "Mary", :stylist_id => 1})
      expect(client.stylist_id()).to(eq(1))
    end
  end

  describe ('.all') do
    it('will be empty at fist') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save to an array of saved clients') do
      client = Client.new({:name => "Mary", :stylist_id => 1})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end
end
