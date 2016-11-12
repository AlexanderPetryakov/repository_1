# Program task1.3 right-angled triangle

puts "Введите значения трех сторон треугольника."

a = gets.to_f
b = gets.to_f
c = gets.to_f
str1 = nil
str2 = nil

if a > b && a > c && a**2 == b**2 + c**2
	str1 = "прямоугольный"
elsif b > a && b > c && b**2 == a**2 + c**2
	str1 = "прямоугольный"
elsif c > a && c > b && c**2 == a**2 + b**2
	str1 = "прямоугольный"
else
	str1 = "не прямоугольный"
end

if a == b || a == c || b == c
	str2 = "равнобедренный"
else
	str2 = "не равнобедренный"
end

puts "Треугольник #{str1}, #{str2}."
