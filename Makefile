HEX = search_s.hex sort_s.hex first_s.hex fact_s.hex first1.hex first2.hex quadratic_s.hex sum_array_s.hex

all: ${HEX}

%.hex : %.o
	objdump -d $< | python makerom.py > $@

%.o : %.s
	as -o $@ $<

clean:
	rm -f *_s.hex *_s.o
