# with open('input.txt', 'r') as myfile:

#   total = 0
#   for line in [s for s in myfile.readlines()]:
#     nums = list(map(int, line.split( )))
#     total += max(nums) - min(nums)

#   print(total)

with open('input.txt', 'r') as myfile:
  input = 347991
  total = 0
  for line in [s for s in myfile.readlines()]:
    nums = list(map(int, line.split( )))
    total += max(nums) - min(nums)

  print(total)
