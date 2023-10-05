 
# def sum_digits(num):
#   # Initialize a variable to store the sum of digits
#   sum = 0
 
#   # Iterate over each digit in the number
#   for digit in str(num):
#     # Add the current digit to the sum
#     sum += int(digit)
 
#   # Return the sum of digits
#   return sum
 
# Test the function
# print(sum_digits(123)) # 6
# print(sum_digits(1234)) # 10
# print(sum_digits(1234567890)) # 45


import math
class Solution:
   def solve(self, n):
      if n < 10:
         return n
      s = 0
      l = math.floor(math.log(n, 10) + 1)
      while l > 0:
         s += n % 10
         n //= 10
         l -= 1
      return self.solve(s)
soln = Solution()
print(soln.solve(2376))