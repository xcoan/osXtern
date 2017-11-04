# Xtern Technical Interview - Question 3, 2017
# Author: X Coan, xjcoan@gmail.com

# This solution allows for more than one process to be running at a time.

# "global" array of running processes
@process_array = []

def input_processes
  # get process input. stop getting input on blank line
  puts 'Enter process numbers.'
  puts 'Enter blank line when done: '
  @process_array = []
  # Loop until no more input
  until (input_num = gets) == "\n"
    # If the process exists, it must be exiting.
    # Removes the process from the processing array.
    if @process_array.include? input_num
      @process_array.delete(input_num)
    else
      # append the process to the array
      @process_array << input_num
    end
  end
end

def print_processes
  # print remaining processes
  if @process_array.empty?
    # 0 if no processes exist
    puts '0'
  else
    # remaining processes
    puts @process_array
  end
end

def main
  input_processes
  print_processes
end

# runs main method
main
