%% This module demonstrates the OTP supervision tree structure
%% The application consists of:
%% 1. An application behaviour module (simple_app)
%% 2. A supervisor module (simple_supervisor) that manages child processes
%% 3. A worker module (simple_worker) that implements gen_server behaviour

-module(random_sup_tree).
-export([start_app/0, stop_app/0, get_supervisor_pid/0]).

%% Function to start the entire application
start_app() ->
    application:start(simple_app).

%% Function to stop the application
stop_app() ->
    application:stop(simple_app).

%% Function to get the supervisor's PID
get_supervisor_pid() ->
    whereis(simple_supervisor).