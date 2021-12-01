def recalculate_shift(shift)
  shift = shift >= 26 ? (shift % 26) : shift
end

def shift_character(string, character, shift)
  if string.index(character) + shift < 26
    string[string.index(character) + shift]
  else
    string[(26 - string.index(character) - shift).abs()]
  end
end

ALPHABET_LOWER = "abcdefghijklmnopqrstuvwxyz"
ALPHABET_UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

def caesar_cipher(message, shift)
  shift = recalculate_shift(shift)

  message_array = message.split("")

  encrypted_array = message_array.map do |character|
    if ALPHABET_LOWER.include?(character)
      shift_character(ALPHABET_LOWER, character, shift)
    elsif ALPHABET_UPPER.include?(character)
      shift_character(ALPHABET_UPPER, character, shift)
    else
      character
    end
  end

  encrypted_array.join("")

end


puts "Please enter a message to encrypt: "
MESSAGE = gets.chomp
puts "Please enter a shift (key): "
SHIFT = gets.chomp.to_i
ENCRYPTED_MESSAGE = caesar_cipher(MESSAGE, SHIFT)
puts "Your Caesar-shifted (encrypted) message is: #{ENCRYPTED_MESSAGE}"