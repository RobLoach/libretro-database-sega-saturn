const fs = require('fs')
var xml = require('xml2js').Parser()
var pkg = require('./package')
var games = []

// Read the XML file.
fs.readFile('tmp/saturn.xml', function (err, data) {
	// Parse the XML.
	xml.parseString(data, function (err, result) {
		// Construct the header.
		var header = result.datafile.header[0]
		var output = `clrmamepro (
	name "${header.name}"
	description "${header.name}"
	version "${header.version}"
	comment "${pkg.description}"
	homepage "${pkg.homepage}"
)\n`

		// Loop through each game.
		for (var i in result.datafile.game) {
			var game = result.datafile.game[i]

			// Find Track 1, since that is the only one to load.
			for (var x in game.rom) {
				var rom = game.rom[x]['$']
				if (rom.name.indexOf('(Track 1)') >= 0 || rom.name.indexOf('(Track 01)') >= 0) {
					// Output the rom entry.
					output += `\ngame (
	name "${game.description[0]}"
	description "${game.description[0]}"
	rom ( name "${rom.name}" size ${rom.size} crc ${rom.crc} md5 ${rom.md5} sha1 ${rom.sha1} )
)\n`
					break;
				}
			}
		}

		fs.writeFileSync('tmp/Sega - Saturn.dat', output);
	})
});
