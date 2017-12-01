from functools import reduce
with open('input.txt', 'r') as myfile:
  nums = [int(s) for s in myfile.read().rstrip()]
  print(reduce(lambda sum, x: sum + x[0] if x[0] == x[1] else sum, zip(nums, nums[1:] + [nums[0]]), 0))
  print(2 * reduce(lambda sum, x: sum + x[0] if x[0] == x[1] else sum, zip(nums[int(len(nums)/2):], nums[:int(len(nums)/2)]), 0))
