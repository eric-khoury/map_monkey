require 'net/http'
require 'rexml/document'

module MapMonkey
  class Position
    attr_accessor :city, :street, :zip

    def initialize(params)
      @city   = URI.encode(params.fetch(:city, ""))
      @street = URI.encode(params.fetch(:street, ""))
      @zip    = URI.encode(params.fetch(:zip, ""))
    end

    def city
      @city
    end

    def street
      @street
    end

    def zip
      @zip
    end

    def url
      "http://maps.googleapis.com/maps/api/geocode/xml?address=#{street}#{zip}#{city}&sensor=false"
    end

    def response
      Net::HTTP.get_response(URI.parse(url)).body
    end

    def get_lat
      doc = REXML::Document.new(response)

      doc.elements.each('GeocodeResponse/result/geometry/location/lat') do |ele|
        @lat = ele.text
      end

      @lat
    end

    def get_lng
      doc = REXML::Document.new(response)

      doc.elements.each('GeocodeResponse/result/geometry/location/lng') do |ele|
        @lng = ele.text
      end

      @lng
    end

    def get_lat_lng
      [get_lat, get_lng]
    end
  end
end
