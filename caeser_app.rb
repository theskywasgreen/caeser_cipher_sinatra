require 'sinatra'
require 'sinatra/reloader' if development?

FIRST_UPPER = "A".ord
LAST_UPPER = "Z".ord
FIRST_LOWER = "a".ord
LAST_LOWER = "z".ord

get '/' do
  string = params['string']
  shift_factor = params['shift'].to_i
end

def caeser_cipher(string, shift)
  cipher = ""

  string.split("").each do |char|
    if char.ord.between?(FIRST_UPPER, LAST_UPPER)
      char = ((((char.ord - FIRST_UPPER) + shift) % 26) + FIRST_UPPER).chr
    elsif char.ord.between?(FIRST_LOWER, LAST_LOWER)
      char = ((((char.ord - FIRST_LOWER) + shift) % 26) + FIRST_LOWER).chr
    end

  cipher << char

  end

  return cipher

end
