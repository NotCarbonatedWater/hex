HEX = search_s.hex sort_s.hex first_s.hex

all: ${HEX}

%.hex : %.o
		objdump -d $< | python makerom.py > $@

%.o : %.s
		as -o $@ $<

clean:
		rm -f *_s.hex *_s.o

