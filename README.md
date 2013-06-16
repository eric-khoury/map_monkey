map_monkey
==========

What it does:
Retrievs lat and long positions from Google Maps Api, with parameters city, street and zip code.

Install:
`gem install map_monkey`

==========
Example of usage:

`pos = Position.new` <br />
`pos.lat('göteborg', 'kabelgatan', '41457')`
>> "57.6896877"

==========
No checking for getting back multiple results <br />
==========
