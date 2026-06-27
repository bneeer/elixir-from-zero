defmodule WordCount do
    def ask_mode(body) do
        mode = IO.gets("Choose to count by \"words\", \"characters\" or \"lines\":") |> String.trim()
        case mode do
            "words" -> WordCount.count_words(body) |> IO.puts()
            "characters" -> WordCount.count_characters(body) |> IO.puts()
            "lines" -> WordCount.count_lines(body) |> IO.puts()
            _ -> IO.puts("Invalid option!\n")
            ask_mode(body)
        end
    end
    def count_words (contents) do
        String.split(contents, ~r{(\\n|[^\w'])+}) |> Enum.filter(fn x -> x != "" end) |> Enum.count()
    end
    def count_characters (contents) do
        String.split(contents, "") |> Enum.count()
    end
    def count_lines(contents) do
        String.split(contents, "\n") |> Enum.count()
    end
end


filename = IO.gets("Enter a file to count from:") |> String.trim()
body = File.read!(filename)
WordCount.ask_mode(body)

# ! makes the program crash if file isL not readable
# ~r{} is a sigil for regex

#words = 
#    |> String.split( ~r{(\\n|[^\w'])+}) #A regex to split a string by everything that is neither a word nor a line-break or an '  
#    |> Enum.filter(fn x -> x != "" end) #An annonymous function that checks whether or not a string is empty

# IO.puts() will interpret characters such as line-breaks, returns, tabs etc, while IO.inspect() will return them litteraly
# IO.inspect(words)
# IO.puts(words)
#words |> Enum.count() |> IO.puts()
