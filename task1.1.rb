#Program task 1.1 name and weight

print "Введите Ваше имя: "
name = gets.chomp
#name.capitalize!

print "Введите Ваш рост в сантиметрах: "
height = gets.to_i

weight = height - 110

if weight < 0
	puts "Ваш вес уже оптимальный!"
else 	
	puts "#{name}, Ваш идеальный вес составляет #{weight} кг."
end
