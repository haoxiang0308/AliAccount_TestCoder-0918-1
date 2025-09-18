PROJECT = counter_app
SOURCES = counter_57b1584e.erl counter_app.erl
ERLC_FLAGS = -Wall

all: compile

compile:
	erlc $(ERLC_FLAGS) $(SOURCES)

clean:
	rm -f *.beam

run: compile
	erl -pa . -eval "application:start($(PROJECT))" -noshell

stop:
	erl -pa . -eval "application:stop($(PROJECT))" -noshell

.PHONY: all compile clean run stop