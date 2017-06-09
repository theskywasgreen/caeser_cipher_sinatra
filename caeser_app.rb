require 'sinatra'
require 'sinatra/reloader' if development?

FIRST_UPPER = "A".ord
LAST_UPPER = "Z".ord
FIRST_LOWER = "a".ord
LAST_LOWER = "z".ord

get '/' do
  string = params['string']
  shift_factor = params['shift'].to_i
  encoded_message = encode(string, shift_factor)
#  bg_color = css_color(string)
  erb :index, :locals => {:encoded_message => encoded_message, :string => string}
end

def encode(string, shift_factor)
  return 'You cannot encode nothing' if string.nil? || string == ""
  return string if shift_factor.zero?
  encoded_message = encode_chars(string, shift_factor)
  encoded_message
end

def encode_chars(string, shift_factor)
  encoded_message = ''
  string.each_char do |char|
    if char.ord.between?(FIRST_UPPER, LAST_UPPER)
      char = ((((char.ord - FIRST_UPPER) + shift_factor) % 26) + FIRST_UPPER).chr
    elsif char.ord.between?(FIRST_LOWER, LAST_LOWER)
      char = ((((char.ord - FIRST_LOWER) + shift_factor) % 26) + FIRST_LOWER).chr
    end
    encoded_message << char
  end
  encoded_message
end



#def css_color(string)
#  case
#  when string.to_s.length == 4 then "#ffd5be"
#  when string.to_s.length == 5 then "#ff0064"
#  end
#end
