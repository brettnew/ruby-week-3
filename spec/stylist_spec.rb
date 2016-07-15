require('spec_helper')

describe(Stylist) do
  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('tells you the name of the stylist') do
      stylist = Stylist.new({:name => "Kat", :id => nil})
      expect(stylist.name()).to(eq("Kat"))
    end
  end

  describe('#id') do
    it ('sets its ID when you save it') do
      stylist = Stylist.new({:name => "Kat", :id => nil})
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it('let you save stylists to the database') do
      stylist = Stylist.new({:name => "Kat", :id => nil})
      expect(stylist.save()).to(eq)[stylist]
    end
  end

  describe('#==') do
    it('is the same stylist if it has the same name and id') do
      stylist1 = Stylist.new({:name => "Kat", :id => nil})
      stylist2 = Stylist.new({:name => "Kat", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe('.find') do
    it ('returns a stylist by its ID') do
      stylist1 = Stylist.new({:name => "Kat", :id => nil})
      stylist1.save()
      stylist2 = Stylist.new({:name => "Emily", :id => nil})
      stylist2.save()
      expect(Stylist.find(stylist2.id())).to(eq(stylist2))
    end
  end
end
