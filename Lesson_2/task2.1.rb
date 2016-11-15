# program hash months 

hash1 = {
"Jan" => 31,
"Feb" => 28,
"March" => 31,
"April" => 30,
"May" => 31,
"June" => 30,
"July" => 31,
"August" => 31,
"Sep" => 30,
"Oct" => 31,
"Nov" => 30,
"Dec" => 31
}

hash1.keys.each do |month|
  if hash1[month] == 30
  puts month
  else 
  end
end
