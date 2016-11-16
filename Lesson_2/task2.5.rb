# program date

print "Введите год: "
year = gets.to_i
print "Введите месяц (число от 1 до 12): "
month = gets.to_i
print "Введите дату: "
date = gets.to_i
days = 0

arr_year = [31,28,31,30,31,30,31,31,30,31,30,31]

arr_year[1] = 29 if (year%4 == 0 && year%100 != 0) || year%400 == 0
  
for index in (0...month-1)
  days += arr_year[index]
end
  
days += date
puts "Порядковый номер даты: #{days}"
