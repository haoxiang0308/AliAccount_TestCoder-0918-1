# Makefile for simple_app

compile:
	erlc -o ebin *.erl

clean:
	rm -f ebin/*.beam

start:
	erl -pa ebin -boot start_sasl -s simple_app

.PHONY: compile clean start