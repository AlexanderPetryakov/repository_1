# program task2.6 shopping

shopping = Hash.new
total = 0

loop do
  print "Введите название товара (если хотите остановить ввод введите: стоп): "
    product = gets.chomp
  break if product == "стоп"
  print "Введите стоимость товара: "
    input1 = gets.chomp
    if input1.include? ","
      input1.gsub!(/,/, ".")
    end
    price = input1.to_f
  print "Введите количество товара: "
    input2 = gets.chomp
    if input2.include? ","
      input2.gsub!(/,/, ".")
    end
    amount = input2.to_f
shopping[product] = {"стоимость" => price, "количество" => amount}
end

shopping.each do |a, b|
  puts "товар: #{a}, стоимость: #{b["стоимость"]}, количество: #{b["количество"]}, сумма: #{b["стоимость"]*b["количество"]}"
    total += b["стоимость"]*b["количество"]
end

puts "Сумма по всем покупкам: " + total.to_s
