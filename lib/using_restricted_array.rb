require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity:
#   1 + 2n = O(n) where n is the length of the input array.
# Space complexity:
#   O(1). Besides the array, the method uses only an additional
#   local variable.
def length(array)
  i = 0
  until array[i] == nil do
    i += 1
  end
  return i
end

# Prints each integer values in the array
# Time complexity: ?
# Space complexity: ?
def print_array(array)
  raise NotImplementedError
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity:
#   O(n) where n is the length of the array. Worst case, the value is
#   not in the array and we had to visit every element to check it.
# Space complexity:
#   O(1). We only needed one local variable in addition to the passed-in
#   parameters.
def search(array, length, value_to_find)
  i = 0
  until array[i] == nil do
    return true if array[i] == value_to_find
    i += 1
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity:
#   O(n) where n is the length of the array. We have to inspect every
#   element of the array to determine if it is the max, since we cannot
#   assume the elements are ordered.
# Space complexity:
#   O(1). We only need two additional local variables.
def find_largest(array, length)
  return nil if array[0] == nil

  max = array[0]
  i = 1
  until array[i] == nil do
    max = array[i] > max ? array[i] : max
    i += 1
  end

  return max
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: Equivalent to find_largest
# Space complexity: Equivalent to find_largest
def find_smallest(array, length)
  return nil if array[0] == nil

  min = array[0]
  i = 1
  until array[i] == nil do
    min = array[i] < min ? array[i] : min
    i += 1
  end

  return min
end

# Reverses the values in the integer array in place
# Time complexity:
#   There is 1 edge case operation. There are 5 operations prior to the loop.
#   The loop runs n / 2 times.
#   Each iteration, the loop does 6 operations.
#   The total time complexity is thus 6 + 6(n/2) = O(n)
# Space complexity:
#   O(1). We allocate space for 3 additional integers.
#   All changes to the string are done in place, requiring no space beyond that.
def reverse(array, length)
  if length < 2 then
    return array
  end

  # Until you reach the middle of the array, swap
  # an element from the front half with an element
  # from the back half.
  curr = 0
  mid = length / 2
  last = length - 1
  until curr == mid do
    array[curr], array[last - curr] = array[last - curr], array[curr]
    curr += 1
  end

  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity:
#   O(log_2(n)) where n is the length of the array. Every iteration through
#   the loop, we halve the size of the search space. We can only halve the
#   problems space log_2(n) times before we run out of array to halve.
# Space complexity:
#   O(1). We use 3 local variables.
def binary_search(array, length, value_to_find)
  upper = length
  lower = 0
  until upper - 1 <= lower do
    pos = lower + (upper - lower) / 2
    return true if array[pos] == value_to_find

    if value_to_find > array[pos] then
      lower = pos
    else
      upper = pos
    end
    # puts "Looking for #{value_to_find} in range #{lower}..#{upper} at pos #{pos}"
  end

  return true if array[pos - 1] == value_to_find

  return false
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the number of elements in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
