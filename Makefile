.PHONY=wheel
wheel: test
	source env.sh && scripts/build.sh

.PHONY=test
test:
	source env.sh && test

.PHONY=clean
clean:
	rm -rf env/

.PHONY=help
help:
	@echo "available targets -->\n"
	@cat Makefile | grep ".PHONY" | python3 -c 'import sys; sys.stdout.write("".join(list(map(lambda line: line.replace(".PHONY"+"=", "") if (".PHONY"+"=") in line else "", sys.stdin))))'

