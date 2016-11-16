# program Fibonacci numbers starting from 0 

fib_array = [0]
i = 1

loop do
  fib_array << i
  i = fib_array[-2] + fib_array[-1]
break if i > 100
end

#puts fib_array
