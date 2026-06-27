defmodule Greeting do
    
    def hello do
        name = IO.gets "Hi, what's your name?"
        case String.trim(name) do
            "Abner" -> IO.puts("Wow, that's a great name!")
            _ -> IO.puts "Hi, " <> String.trim(name) <> ", nice to meet you!"
        end
    end

end