# program Fibonacci numbers starting from 0 

fib_array = [0]
i = 1
k = 0
loop do
  fib_array << i
  i = fib_array[k] + fib_array[k + 1]
  k += 1
break if i > 100
end

#puts fib_array
