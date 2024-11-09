=begin
--- P
Input: a list of names
Output: each name deciphered
Rules:
- ROT13 is a letter substitution cipher that replaces a letter with one that is 13 letters after it.
--- E
Nqn --- Ada ---> ord - 13
--- D
Input: an array of strings
Output: string names
A-Z: 65-90
a-z: 97-122
--- A-Broad
- Iterate through the list of encrypted names and print the decrypted version of each name.
  - Decrypt each name in the list.
    - Decrypt each character in the name.
--- A-Detailed
- Iterate through given array of encrypted names, accessing each name.
  - Print the decrypted version of each name (helper method).

Helper method `rot13`
- Convert name to array of chars. 
- Iterate over array, accessing each char.
  - Decipher the current char (helper method).
- Return deciphered name.

Helper method `decipher_char`
- If char is A-M / a-m, add 13 to its numeric ASCII equivalent. Then convert it back to its character equivalent.
- If char is N-Z / n-z, subtract 13 from its numeric ASCII equivalent. Then convert it back to its character equivalent.
- Else, return char.
=end

# --- C1
ENCRYPTED_NAMES = [
"Nqn Ybirynpr",
"Tenpr Ubccre",
"Nqryr Tbyqfgvar",
"Nyna Ghevat",
"Puneyrf Onoontr",
"Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
"Wbua Ngnanfbss",
"Ybvf Unvog",
"Pynhqr Funaaba",
"Fgrir Wbof",
"Ovyy Tngrf",
"Gvz Orearef-Yrr",
"Fgrir Jbmavnx",
"Xbaenq Mhfr",
"Fve Nagbal Ubner",
"Zneiva Zvafxl",
"Lhxvuveb Zngfhzbgb",
"Unllvz Fybavzfxv",
"Tregehqr Oynapu",
]

def rot13(encrypted_name)
  encrypted_name.chars.map { |char| decipher_char(char) }.join
end

def decipher_char(char)
  if char == ' '
    ' '
  elsif char =~ /[A-Ma-m]/
    (char.ord + 13).chr
  elsif char =~ /[N-Zn-z]/
    (char.ord - 13).chr
  end
end

ENCRYPTED_NAMES.each { |encrypted_name| puts rot13(encrypted_name) }

# --- C2
# We use the description of Rot13 directly ("rotate" each character by 13).
# We set up a constant array `ENCRYPTED_PIONEERS` that contains our encrypted list of pioneers. We want to iterate through this list, and print each decrypted name. 
# We use a method `rot13` to decrypt each name in the list. Within this method, we use a helper method `decipher_character` to decrypt each character. We use `String#each_char` and Enumerable#reduce` to iterate through the characters in `encrypted_text` and construct the decrypted return value.
# `decipher_character` uses a `case` statement that breaks the character decryption problem into 3 parts:  
  # 1) The letters between A and M (upper- and lowercase). We shift the character 13 places forward ('A' becomes 'N', 'B' becomes 'O', etc.) with `String#ord`, which converts a character to numeric value, and `Integer#chr`, which converts a numeric value to a character.
  # 2) The letters between N and Z (upper- and lowercase). We do something similar, but this time, we shift the letters to the left by 13 places ('N' becomes 'A', 'O' becomes 'B', etc.)
  # 3) Everything else. We return the unchanged value.

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu',
  ]
  
def decrypt_char(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then
  (encrypted_char.ord - 13).chr
  else
  encrypted_char
  end
end
  
def rot13(encrypted_name)
  encrypted_name.each_char.reduce('') do |result, encrypted_char|
    result + decrypt_char(encrypted_char)
  end
end
  
ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end