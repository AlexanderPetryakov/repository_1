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

hash1.each do |month, days|
  puts month if days == 30
end
