def caesar_cipher(message, shift)
  shift = shift >= 26 ? (shift % 26) : shift

  alphabet_lower = "abcdefghijklmnopqrstuvwxyz"
  alphabet_upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  message_array = message.split("")

  encrypted_array = message_array.map do |character|
    if alphabet_lower.include?(character)
      if alphabet_lower.index(character) + shift < 26
        alphabet_lower[alphabet_lower.index(character) + shift]
      else
        alphabet_lower[(26 - alphabet_lower.index(character) - shift).abs()]
      end
    elsif alphabet_upper.include?(character)
      if alphabet_upper.index(character) + shift < 26
        alphabet_upper[alphabet_upper.index(character) + shift]
      else
        alphabet_upper[(26 - alphabet_upper.index(character) - shift).abs()]
      end
    else
      character
    end
  end

  encrypted_array.join("")

end

puts caesar_cipher("z", 1)
puts caesar_cipher("what a string", 5)
puts caesar_cipher("Y", 2)
puts caesar_cipher("What a string!", 5)