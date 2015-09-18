test: tmp/bats/bin/bats bin/wc
	./tmp/bats/bin/bats ./test/wc.bats

tmp/bats/bin/bats:
	mkdir -p tmp
	git clone --quiet https://github.com/sstephenson/bats.git tmp/bats

bin/wc: src/wc.cr
	mkdir -p bin
	crystal build src/wc.cr -o bin/wc --release

clean:
	rm -rf bin
	rm -rf tmp

.PHONY: clean test
