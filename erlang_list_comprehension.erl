-module(erlang_list_comprehension).
-export([generate_and_save/0, random_string/1]).

% Generate a sequence using list comprehension and save to a random file name
generate_and_save() ->
    % Generate a sequence using list comprehension (e.g., squares of numbers 1 to 10)
    Sequence = [X*X || X <- lists:seq(1, 10)],
    
    % Generate a random file name
    RandomName = random_string(10),
    FileName = RandomName ++ ".txt",
    
    % Convert the sequence to a string for writing to file
    Content = lists:flatten(io_lib:format("~p~n", [Sequence])),
    
    % Write the sequence to the file
    case file:write_file(FileName, Content) of
        ok -> 
            io:format("Sequence ~p saved to file: ~s~n", [Sequence, FileName]);
        {error, Reason} ->
            io:format("Error writing file ~s: ~p~n", [FileName, Reason])
    end.

% Function to generate a random string of given length
random_string(Length) ->
    Charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
    lists:foldl(
        fun(_, Acc) -> 
            [lists:nth(rand:uniform(length(Charset)), Charset) | Acc] 
        end, 
        [], 
        lists:seq(1, Length)
    ).