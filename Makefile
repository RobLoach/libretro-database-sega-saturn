default: tmp/Sega\ -\ Saturn.dat

tmp:
	mkdir tmp

tmp/saturn.zip: tmp
	wget -O tmp/saturn.zip http://redump.org/datfile/ss/

tmp/saturn.xml: tmp/saturn.zip
	unzip tmp/saturn.zip -d tmp
	mv tmp/*.dat tmp/saturn.xml

tmp/Sega\ -\ Saturn.dat: tmp/saturn.xml
	node .

clean:
	rm -rf tmp
