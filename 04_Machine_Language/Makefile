leds:
	sh /home/vincent/Documents/courses/nand2tetris/tools/Assembler.sh leds.asm
	cp leds.hack ../05_Computer_Architecture/04_HACK/ROM.hack
mult:
	sh /home/vincent/Documents/courses/nand2tetris/tools/Assembler.sh mult.asm
	cp mult.hack ../05_Computer_Architecture/04_HACK/ROM.hack
upload:
	sh /home/vincent/Documents/courses/nand2tetris/tools/Assembler.sh leds.asm
	../tools/AsciiToBin.py leds.hack
	iceprogduino -o 64k -w leds.bin
clean:
	rm -f *.hack *~ *.bin

.PHONY: clean
