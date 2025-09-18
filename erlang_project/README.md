# Counter gen_server

This is a simple Erlang/OTP gen_server implementation that manages a counter state.

## Modules

- `counter_57b1584e`: The gen_server implementation for managing the counter state
- `counter_app`: The application behavior module

## API

- `start_link/0`: Starts the gen_server
- `increment/0`: Increments the counter by 1 (cast)
- `decrement/0`: Decrements the counter by 1 (cast)
- `get_count/0`: Returns the current counter value (call)

## Usage

If you have Erlang installed, you can compile and run the application using:

```bash
make compile
make run
```

Then in another terminal, you can interact with the server:

```erlang
counter_57b1584e:get_count().  % Returns 0
counter_57b1584e:increment().  % Increments the counter
counter_57b1584e:get_count().  % Returns 1
```