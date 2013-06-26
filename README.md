map_monkey
==========
Retrievs lat and long positions from Google Maps Api, with parameters city, street and zip code.

Install:
`gem install map_monkey`

==========
Example of usage:

`pos = MapMonkey::Position.new(city: 'göteborg', street: 'kabelgatan', zip: '41457')` <br />
`pos.get_lat`<br />
=> "57.6896877"

==========
