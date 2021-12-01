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

def caesar_cipher(message, shift)
  shift = recalculate_shift(shift)

  alphabet_lower = "abcdefghijklmnopqrstuvwxyz"
  alphabet_upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  message_array = message.split("")

  encrypted_array = message_array.map do |character|
    if alphabet_lower.include?(character)
      shift_character(alphabet_lower, character, shift)
    elsif alphabet_upper.include?(character)
      shift_character(alphabet_upper, character, shift)
    else
      character
    end
  end

  encrypted_array.join("")

end

def recalculate_shift(shift)
  shift = shift >= 26 ? (shift % 26) : shift
end


puts caesar_cipher("What a string!", 5)