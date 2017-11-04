# Xtern Technical Interview - Question 1, 2017
# Author: X Coan, xjcoan@gmail.com

# This solution does most of the computation when users are entered, or in a
# "back-end" setting, as opposed to a "client-side" solution.  If we were using
# a web framework, like Rails, we would be able to access users saved to a DB
# quickly with a query, such as 'SELECT username from USERS where account_type = "User"'

# Global hash of users
@users = {}

# Assumes all users will be entered at once
# Assuning no input sanitization is necessary if both the username and group will
# always match the regex

# assumes entering a duplicate username will update the group to the latest input


# Gets input of new users to be entered into the system
def input_new_users
  puts 'Enter new users in format: <username group>: '
  puts 'Enter blank line when done'
  # array containing username and group
  user_array = []
  # array for just usernames to see if user already exists
  usernames = []
  # Loop until no more input
  until (input = gets) == "\n"
    username = input.split(' ').first
    # if the user has already been entered
    if usernames.include? username
      # index of user should be the same across both arrays
      user_array[usernames.index(username)] = input
    else
      user_array << input
      usernames << username
    end
  end
  sort_new_users(user_array)
end

def sort_new_users(user_array)
  user_array.each do |user|
    user = user.strip
    user_params = user.split(' ')
    username = user_params.first
    group = user_params.last
    if @users.key?(group)
      current_users = @users[group]
      current_users += ',' + username
      @users[group] = current_users
    else
      @users[group] = username
    end
  end
end

# Print all users in system in format group,user1,user2,...
def print_users
  output = ''
  @users.each do |key, value|
    output += key
    output += ",#{value}"
    output += "\n"
  end
  # places each category onto a new line.
  puts output
end

def main
  input_new_users
  print_users
end

main
