require 'rspec'
require 'map_monkey'

describe "position" do
  before do
    @pos = MapMonkey::Position.new(city: "gothenburg", street: "kabelgatan", zip: "41457")
  end

  it "can assign city" do
    @pos.city.should eq "gothenburg"
  end

  it "can assign street" do
    @pos.street.should eq "kabelgatan"
  end

  it "can assign zip" do
    @pos.zip.should eq "41457"
  end

  it "can get lat coordinate" do
    @pos.get_lat.should == "57.6892275"
  end

  it "can get lng coordinate" do
    @pos.get_lng.should == "11.9253258"
  end

  it "can get lat_lng coordinates" do
    @pos.get_lat_lng.should == ["57.6892275", "11.9253258"]
  end
end
