#!/usr/bin/env elixir

# Load the compiled module
Code.require_file("Elixir.GreetingModule42.beam")

# Test the greet function
IO.puts(GreetingModule42.greet("World"))
IO.puts(GreetingModule42.greet("Elixir Developer"))