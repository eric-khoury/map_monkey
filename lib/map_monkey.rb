require 'net/http'
require 'rexml/document'

class Position

  attr_accessor :city, :street, :zip

  def initialize(city = "", street = "", zip = "")
    @city = city(city)
    @street = street(street)
    @zip = zip(zip)
  end

  def city(city)
    URI.encode(city)
  end

  def street(street)
    URI.encode(street)
  end

  def zip(zip)
    URI.encode(zip)
	end

  def url
    "http://maps.googleapis.com/maps/api/geocode/xml?address=#{@street}#{@zip}#{@city}&sensor=false"
  end

  def get_data
    Net::HTTP.get_response(URI.parse(url)).body
  end

  def lat
    doc = REXML::Document.new(get_data)

    doc.elements.each('GeocodeResponse/result/geometry/location/lat') do |ele|
      self.lat = ele.text
    end

    lat
  end

  def lng
    doc = REXML::Document.new(get_data)

    doc.elements.each('GeocodeResponse/result/geometry/location/lng') do |ele|
      lng = ele.text
    end

    lng
  end

  def lat_lng
    doc = REXML::Document.new(get_data)

    doc.elements.each('GeocodeResponse/result/geometry/location/lat') do |ele|
      lat = ele.text
    end

    doc.elements.each('GeocodeResponse/result/geometry/location/lng') do |ele|
      lng = ele.text
    end

    lat_lng = [lat, lng]

    lat_lng
  end
end
