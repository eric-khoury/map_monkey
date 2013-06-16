require 'net/http'
require 'rexml/document'

class Position

	attr_accessor :city, :street, :zip

	def initialize(city, street, zip)
		self.city = city(city)
		self.street = street(street)
		self.zip = zip(zip)
	end

	def city(city)
		@city = URI.encode(city)
	end

	def street(street)
		@street = URI.encode(street)
	end

	def zip(zip)
		@zip = URI.encode(zip)
	end

	def lat
		url = "http://maps.googleapis.com/maps/api/geocode/xml?address="+self.street+self.zip+self.city+"&sensor=false"
		xml_data = Net::HTTP.get_response(URI.parse(url)).body
		doc = REXML::Document.new(xml_data)

		doc.elements.each('GeocodeResponse/result/geometry/location/lat') do |ele|
   			self.lat = ele.text
		end

		lat
	end

	def lng
		url = "http://maps.googleapis.com/maps/api/geocode/xml?address="+self.street+self.zip+self.city+"&sensor=false"
		xml_data = Net::HTTP.get_response(URI.parse(url)).body
		doc = REXML::Document.new(xml_data)

		doc.elements.each('GeocodeResponse/result/geometry/location/lng') do |ele|
   			lng = ele.text
		end

		lng
	end

	def lat_lng
		url = "http://maps.googleapis.com/maps/api/geocode/xml?address="+self.street+self.zip+self.city+"&sensor=false"
		xml_data = Net::HTTP.get_response(URI.parse(url)).body
		doc = REXML::Document.new(xml_data)

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
