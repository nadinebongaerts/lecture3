include config.mk

TXT_FILES=$(wildcard books/*.txt)
DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))


# Generate archive file.
analysis.tar.gz : *.dat $(DAT_FILES) $(COUNT_SRC)
	tar -czf $@ $^

# Count words.
.PHONY : dats
dats : isles.dat abyss.dat last.dat

%.dat : books/%.txt $(COUNT_SRC)
	python wordcount.py $< $*.dat

.PHONY : clean
clean :
	rm -f $(DAT_FILES)
	rm - analysis.tar.gz

.PHONY: variables
variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
