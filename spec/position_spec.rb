require 'rspec'
require 'map_monkey'

describe "position" do
  it "can assign city" do
    pos = MapMonkey::Position.new(:city => "gothenburg", :street => "kabelgatan", :zip => "41457")

    pos.city.should eq "gothenburg"
  end

  it "can get lat coordinate" do
    pos = MapMonkey::Position.new(:city => "gothenburg", :street => "kabelgatan", :zip => "41457")

    pos.should respond_to(:lat)
  end
end
