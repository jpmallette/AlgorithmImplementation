############################################################################################################################################################
                                                                                                                                                           # 
# title : codibility binary gap challenge                                                                                                                  #
# author : Jean-Philippe Mallette                                                                                                                          #    
                                                                                                                                                           #
############################################################################################################################################################
# problem statement ------------------------------------

# challenge : given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.
# definition: A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N. The length is the number of 0 (1001). here it's 2. If a number is 10010001. There there is 2 gap. the longest length is 0 
# assumption : range of 2 bilions damn

# how to solve the problem ------------------------------------

# first shot : I am not sure this is going to scale for big number

# 1 : understand how binary number are represented
# 2 : create a function that given an integer the function return the binary string format
# 3 : create a function that given a binary string it returns the position of all the 0
    # work ? 1001001 : 1 4 7   1111 : 1 2 3 4 100111 : 1 4 5 6 
# 4 : create a function that given a string of position of 1 in the binary number, return the difference 
#     of all index (string_character_position + 1) - (string_character_position)  -  1 (string_character_position range 1 : length(string position - 1)
# 5 : return the longest number of the step 4 

# optimal shot : if the function does not scale. 
  # between step 2 and 3 create a function that split the binary string format into let's say max 30 character. And compute
  # the further step with smaller string

library(Hmisc) # for Lag function
number = 2147483647 # it's actually the highest number accepted in R 

solving <- function(number) {
  binary_vector         <- rev(as.numeric(intToBits(number)))
  string_binary_vector  <- paste(as.character(binary_vector),collapse = '')
  string_position_1     <- unlist(gregexpr(pattern ='1',string_binary_vector))
  all_binary_gap_length <- Lag(string_position_1, shift = -1) - string_position_1 - 1
  longest_binary_gap    <- max(all_binary_gap_length,na.rm = T)
  return(longest_binary_gap)
}

# is time limit constraint acceptable 
print(system.time(solving(number))[1] < log(number)) 

# testing if function is working. Seems to work
test_case <- rnorm(n = 1000,mean = 10000000,sd = 500000)
sapply(X = test_case,FUN = solving)





