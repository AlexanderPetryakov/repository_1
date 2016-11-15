#program hash vowels

vowels1 = Hash.new
vowels2 = ["а", "е", "и", "о", "у", "ы", "э", "ю", "я"]
alphabet = ('а'..'я')
index = 1

alphabet.each do |letter|
  if vowels2.include?(letter)
  vowels1[letter] = index
  else 
  end
  index += 1
end

vowels1.each {|x, y| puts "#{x} - #{y}"}
