require 'net/http'
require 'rexml/document'

class Position
	def lat(strCity, strStreet, strZip)

		# Clean up the string		
		city = URI.encode(strCity)
		street = URI.encode(strStreet)
		zip = URI.encode(strZip)

		# URL setup
		url = "http://maps.googleapis.com/maps/api/geocode/xml?address=#{ street }#{ zip }#{ city }&sensor=false"

		xml_data = Net::HTTP.get_response(URI.parse(url)).body

		# xml-response
		doc = REXML::Document.new(xml_data)
		
		lat = ""

		doc.elements.each('GeocodeResponse/result/geometry/location/lat') do |ele|
   			lat = ele.text
		end

		return lat
	end

	def lng(strCity, strStreet, strZip)

		# Clean up the string
		city = URI.encode(strCity)
		street = URI.encode(strStreet)
		zip = URI.encode(strZip)

		# URL setup
		url = "http://maps.googleapis.com/maps/api/geocode/xml?address=#{ street }#{ zip }#{ city }&sensor=false"

		xml_data = Net::HTTP.get_response(URI.parse(url)).body

		# xml-response
		doc = REXML::Document.new(xml_data)

		lng = ""

		doc.elements.each('result/geometry/location/lng') do |ele|
   			lng = ele.text
		end

		return lng
	end	
end