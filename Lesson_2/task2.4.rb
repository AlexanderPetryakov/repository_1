#program hash vowels

vowels1 = {}
vowels2 = ["а", "е", "и", "о", "у", "ы", "э", "ю", "я"]
alphabet = ('а'..'я')

alphabet.each_with_index do |letter, index|
  vowels1[letter] = index if vowels2.include?(letter)
end

vowels1.each {|x, y| puts "#{x} - #{y}"}
