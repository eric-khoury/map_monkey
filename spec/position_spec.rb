require 'rspec'
require 'map_monkey'

describe "position" do
  it "can assign city" do
    pos = MapMonkey::Position.new(city: "gothenburg")

    pos.city.should eq "gothenburg"
  end

  it "can assign street" do
    pos = MapMonkey::Position.new(street: "kabelgatan")

    pos.street.should eq "kabelgatan"
  end

  it "can assign zip" do
    pos = MapMonkey::Position.new(zip: "41457")

    pos.zip.should eq "41457"
  end

  it "can get lat coordinate" do
    pos = MapMonkey::Position.new(city: "gothenburg", street: "kabelgatan", zip: "41457")

    pos.get_lat.should == "something else"
  end
end
