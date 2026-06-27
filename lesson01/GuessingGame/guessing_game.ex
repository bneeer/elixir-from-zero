defmodule GuessingGame do
    # This is the Lesson 1 from Alchemist Camp Elixir
    # This is a game where the program tries to guess the number the user is thinking.
    # If user inputs 'yes', then game over
    # If user inputs 'bigger' or 'smaller', it will keep trying to guess
    # If user provides any other input, it will tell them to input 'bigger', 'smaller' or 'yes' 

    def guess(a, b) when a > b do: guess b, a

    def guess(low, high) do
        answer = IO.gets("Hmm... Maybe you're thinking of #{mid(low, high)}?\n")
        case String.trim(answer) do
            "bigger" -> bigger(low, high)
            "smaller" -> smaller(low, high)
            "yes" -> "Game over!"
            _ -> IO.puts ~s{Type "bigger", "smaller" or "yes"}
                guess low, high
        end
    end

    def mid(low, high) do
        div low + high, 2
    end

    def bigger(low, high) do
        new_low = min high, mid(low, high) + 1
        guess new_low, high
    end

    def smaller(low, high) do
        new_high = max low, mid(low, high) - 1
        guess low, new_high
    end

end