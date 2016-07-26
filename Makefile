default: tmp/Sega\ -\ Saturn.dat

tmp:
	rm -rf tmp
	mkdir tmp

tmp/saturn.zip: tmp
	rm -rf tmp/saturn.zip
	wget -O tmp/saturn.zip http://redump.org/datfile/ss/

tmp/saturn.xml: tmp/saturn.zip
	rm -rf tmp/saturn.xml
	unzip tmp/saturn.zip -d tmp
	mv tmp/*.dat tmp/saturn.xml

tmp/Sega\ -\ Saturn.dat: tmp/saturn.xml
	node .

clean:
	rm -rf tmp
