with open('input.txt', 'r') as myfile:
  total = 0
  for line in [s for s in myfile.readlines()]:
    nums = list(map(int, line.split( )))
    total += max(nums) - min(nums)

  print(total)

with open('input.txt', 'r') as myfile:
  total = 0

  for line in [s for s in myfile.readlines()]:
    nums = list(map(int, line.split()))
    nums.sort()
    for i in range(0, len(nums)):
      for j in range(i + 1, len(nums)):
        if  nums[j] % nums[i] == 0:
          total += nums[j] // nums[i]

  print(total)
