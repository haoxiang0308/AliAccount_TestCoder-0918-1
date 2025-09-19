-module(d39Y30Atev_tests).
-include_lib("eunit/include/eunit.hrl").

start_stop_test() ->
    {ok, Pid} = d39Y30Atev:start_link(),
    ?assert(is_pid(Pid)),
    unlink(Pid),
    exit(Pid, kill),
    timer:sleep(100).

counter_test() ->
    {ok, _Pid} = d39Y30Atev:start_link(),
    
    % Check initial state
    ?assertEqual(0, d39Y30Atev:get_count()),
    
    % Test increment
    d39Y30Atev:increment(),
    ?assertEqual(1, d39Y30Atev:get_count()),
    
    % Test multiple increments
    d39Y30Atev:increment(),
    d39Y30Atev:increment(),
    ?assertEqual(3, d39Y30Atev:get_count()),
    
    % Test decrement
    d39Y30Atev:decrement(),
    ?assertEqual(2, d39Y30Atev:get_count()),
    
    % Test multiple decrements
    d39Y30Atev:decrement(),
    d39Y30Atev:decrement(),
    ?assertEqual(0, d39Y30Atev:get_count()),
    
    % Test going negative
    d39Y30Atev:decrement(),
    ?assertEqual(-1, d39Y30Atev:get_count()).