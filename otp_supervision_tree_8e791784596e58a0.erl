%% OTP Supervision Tree Example
%% 
%% This file demonstrates a complete OTP supervision tree structure.
%% The application consists of:
%% 1. An application callback module (my_app_app)
%% 2. A supervisor module (my_app_sup) that manages child processes
%% 3. Worker processes (my_worker) that perform the actual work
%%
%% Supervision Tree Structure:
%% 
%%                    Application
%%                        |
%%                  my_app_app
%%                        |
%%                   my_app_sup (Supervisor)
%%                   /              \
%%        my_worker (gen_server)   my_worker (gen_server)
%%              |                        |
%%         Worker1                   Worker2
%%
%% Supervision Strategy: one_for_one
%% If any child process terminates, only that process is restarted.
%%
%% Child Specifications:
%% - my_worker1: Basic worker process
%% - my_worker2: Named worker process
%%
%% Restart Strategy: permanent
%% The child process is always restarted when it terminates.
%%
%% Shutdown Time: 5000ms
%% The time allowed for the child process to terminate gracefully.
%%
%% Process Type: worker
%% Regular worker processes (not supervisors).
%%
%% This structure ensures fault tolerance by automatically restarting
%% failed processes according to the defined supervision strategy.

-module(otp_supervision_tree_8e791784596e58a0).
-export([start/0, stop/1, info/0]).

start() ->
    application:start(my_app).

stop(_State) ->
    application:stop(my_app).

info() ->
    io:format("OTP Supervision Tree Structure:~n"),
    io:format("- Application: my_app~n"),
    io:format("- Supervisor: my_app_sup (one_for_one strategy)~n"),
    io:format("- Workers: my_worker1, my_worker2~n"),
    io:format("Supervision Strategy: If any child process terminates, only that process is restarted~n").