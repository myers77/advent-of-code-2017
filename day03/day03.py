# input = 347991

# x = 0
# y = 0
# d = 1
# m = 1

# count = 1

# array = dict()

# while count < input:
#   while 2 * x * d < m and count <= input:
#     if count == input:
#       print(abs(x) + (abs(y)))
#       break
#     array[(x, y)] = count
#     x = x + d
#     count += 1
#   while 2 * y * d < m and count <= input:
#     if count == input:
#       print(abs(x) + (abs(y)))
#       break
#     array[(x, y)] = count
#     y = y + d
#     count += 1
#   d = -1 * d
#   m = m + 1

import operator

input = 347991

x = 1
y = 0
d = 1
m = 1

count = 1

array = { (0, 0): 1 }

def get_neighbor_sum(x, y, array):
  sum = 0
  neighbors = [(i, j) for i in range(x - 1, x + 2) for j in range (y - 1, y + 2)]
  neighbors.remove((x, y))
  for neighbor in neighbors:
    if neighbor in array:
      sum += array[neighbor]
  return sum

def spiral(startx, starty, )

while count < input:
  while 2 * x * d < m:
    count = get_neighbor_sum(x, y, array)
    if count > input:
      print(sum)
      break
    array[(x, y)] = count
    x = x + d
  while 2 * y * d < m:
    count = get_neighbor_sum(x, y, array)
    if count > input:
      print(count)
      break
    array[(x, y)] = count
    y = y + d
  d = -1 * d
  m = m + 1