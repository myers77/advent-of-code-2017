from functools import reduce
from collections import Counter
import itertools


with open('input.txt', 'r') as myfile:
  puzzle = myfile.readlines()
  total = 0

  print(reduce(lambda sum, x: sum + x[0] if  else sum, puzzle, 0))

  for line in [s for s in myfile.readlines()]:
    good = True
    nums = line.split()
    for i in Counter(nums).values():
      if i > 1:
        good = False
    if good:
      total += 1

  print(total)


from collections import Counter

with open('input.txt', 'r') as myfile:
  total = 0

  for line in [s for s in myfile.readlines()]:
    good = True
    nums = line.split()
    for a, b in itertools.combinations(nums, 2):
      if Counter(list(a)) == Counter(list(b)):
        good = False
    if good:
      total += 1


  print(total)
