process_the_loop = [true, false].sample
# puts process_the_loop

if process_the_loop
  loop do
    puts "The loop was processed."
    break
  end
else
  puts "The loop wasn't processed!"
end