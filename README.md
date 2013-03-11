map_monkey
==========

What it does:
A ruby gem that helps you retriev lat and lng positions from Google Maps Api, with parameters city, street and zip code.

Install:
`gem install map_monkey`

==========
Example of usage:

`pos = Position.new` <br />
`pos.lat('göteborg', 'kabelgatan', '41457')`
>> "57.6896877"

==========
To fix:
- Everything <br />
- No checking for getting back multiple results <br />
- Refactoring <br />

==========
Cheers