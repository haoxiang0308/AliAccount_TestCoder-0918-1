#!/usr/bin/env elixir

# Start the Mix project application
Mix.Project.in_project(:greeting_project, ".", fn _ -> end)

# Compile the project
Mix.Task.run("compile")

# Use the module
IO.puts(GreetingProject.greet("World"))
IO.puts(GreetingProject.greet("Elixir Developer"))
IO.puts(GreetingProject.greet("Friend"))