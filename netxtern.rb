# Xtern Technical Interview - Question 2, 2017
# Author: X Coan, xjcoan@gmail.com

# The URI, or any of the http parsing gems would be useful here

# This solution makes the assumption that the user has no home page on starting
# a new browser session and instead will open to a blank page.

# Determine link type
def link_type(link)
  # check for browser commands first
  if link == 'back'
    return "BACK"
  end
  if link == 'forward'
    return "FORWARD"
  end
  if link.start_with?('https://')
    return 'absolute url'
  elsif link.start_with?('/')
    return 'absolute path'
  else
    return 'relative path'
  end
end

def main
  # last visited location
  last_location = ''
  current_location = 'blank page'
  forward_location = current_location

  puts 'Enter http params. Enter a blank line when done: '

  # continuously get input
  loop do
    # Get user input
    http_input = gets
    # break if empty line
    break if http_input == "\n"
    http_input = http_input.downcase.chomp
    http_type = link_type(http_input)

    # create url user will currently be at.
    case http_type
    when 'absolute url'
      last_location =  current_location
      current_location = http_input
      forward_location = current_location
    when 'absolute path'
      last_location = current_location
      if current_location.start_with?('https://')
        current_location += http_input
        forward_location = current_location
      else
        current_location = 'INVALID'
        forward_location = last_location
      end
    when 'relative path'
      last_location = current_location
      if current_location.start_with?('https://')
        current_location += "/#{http_input}"
        forward_location = current_location
      else
        current_location = 'INVALID'
        forward_location = last_location
      end
    when 'BACK'
      current_location = last_location
    when 'FORWARD'
      current_location = forward_location
    end

    # display current location to user
    puts "#{current_location}\n"
  end
end

main
