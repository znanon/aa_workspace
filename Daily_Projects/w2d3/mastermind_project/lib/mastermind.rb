require_relative "code"

class Mastermind
    def initialize(len)
        @secret_code = Code.random(len)
    end

    def print_matches(code)
        p @secret_code.num_exact_matches(code)
        p @secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        p "Enter a code"
        input = gets.chomp
        guess_code = Code.from_string(input)
        p @secret_code.num_exact_matches(guess_code)
        p @secret_code.num_near_matches(guess_code)
        @secret_code == guess_code
    end
end
