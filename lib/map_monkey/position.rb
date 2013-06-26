require 'net/http'
require 'rexml/document'

module MapMonkey
  class Position
    attr_accessor :city, :street, :zip

    def initialize(options = {})
      @city   = URI.encode(options.fetch(:city, ""))
      @street = URI.encode(options.fetch(:street, ""))
      @zip    = URI.encode(options.fetch(:zip, ""))
    end

    def city
      URI.encode(@city)
    end

    def street
      URI.encode(@street)
    end

    def zip
      URI.encode(@zip)
    end

    def url
      "http://maps.googleapis.com/maps/api/geocode/xml?address=#{street}#{zip}#{city}&sensor=false"
    end

    def get_data
      Net::HTTP.get_response(URI.parse(url)).body
    end

    def get_lat
      doc = REXML::Document.new(get_data)

      doc.elements.each('GeocodeResponse/result/geometry/location/lat') do |ele|
        @lat = ele.text
      end

      @lat
    end

    def get_lng
      doc = REXML::Document.new(get_data)

      doc.elements.each('GeocodeResponse/result/geometry/location/lng') do |ele|
        @lng = ele.text
      end

      @lng
    end

    def get_lat_lng
      doc = REXML::Document.new(get_data)

      doc.elements.each('GeocodeResponse/result/geometry/location/lat') do |ele|
        @lat = ele.text
      end

      doc.elements.each('GeocodeResponse/result/geometry/location/lng') do |ele|
        @lng = ele.text
      end

      lat_lng = [lat, lng]

      lat_lng
    end
  end
end
