default: tmp/Sega\ -\ Saturn.dat

tmp:
	mkdir tmp

tmp/redump.zip: tmp
	wget -O tmp/redump.zip http://redump.org/datfile/ss/

tmp/tosec.zip: tmp
	wget -O tmp/tosec.zip http://www.tosecdev.org/downloads/category/37-2016-07-02?download=73:tosec-dat-pack-complete-2313-tosec-v2016-07-02

tmp/redump.xml: tmp/redump.zip
	unzip tmp/redump.zip -d tmp
	mv tmp/*.dat tmp/redump.xml

tmp/tosec.xml: tmp/tosec.zip
	unzip tmp/tosec.zip -d tmp
	mv tmp/TOSEC-ISO/Sega\ Saturn\ -\ Games* tmp/tosec.xml

tmp/Sega\ -\ Saturn.dat: tmp/redump.xml tmp/tosec.xml
	node .

clean:
	rm -rf tmp
