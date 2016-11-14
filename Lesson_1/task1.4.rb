# program quadratic equation

puts "Введите 3 коэффициента квадратного уравнения a, b, c."

a = gets.to_f
b = gets.to_f
c = gets.to_f

discr = (b**2 - 4*a*c)/(2*a)

if discr > 0
	root1 = (-b + Math.sqrt(discr))/(2*a)
	root2 = (-b - Math.sqrt(discr))/(2*a)
	puts "Дискриминант = #{discr}, корни уравнения #{root1}, #{root2}."
elsif discr == 0
	root = -b/(2*a)
	puts "Дискриминант = #{discr}, корень уравнения #{root}."
else 
	puts "Дискриминант = #{discr}, корней нет."
end
