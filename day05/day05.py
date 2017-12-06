import itertools
import time

puzzle = [int(line.rstrip('\n')) for line in open('input.txt')]

index = 0
for i in itertools.count():
  if index < 0 or index >= len(puzzle):
    print(i)
    break
  num, puzzle[index] = puzzle[index], puzzle[index] + 1
  index += num

start = time.time()
puzzle = [int(line.rstrip('\n')) for line in open('input.txt')]

index = 0
steps = 0
while index >= 0 and index < len(puzzle):
  num = puzzle[index]
  puzzle[index] = puzzle[index] - 1 if (num >= 3) else puzzle[index] + 1
  index += num
  steps += 1

print(steps)
print(time.time() - start)
