import random

# Deterministic Quick Sort (always picks last element as pivot)
def deterministic_quick_sort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[-1]  # last element as pivot
    left = [x for x in arr[:-1] if x <= pivot]
    right = [x for x in arr[:-1] if x > pivot]
    return deterministic_quick_sort(left) + [pivot] + deterministic_quick_sort(right)


# Randomized Quick Sort (picks random pivot)
def randomized_quick_sort(arr):
    if len(arr) <= 1:
        return arr
    pivot = random.choice(arr)  # random pivot
    left = [x for x in arr if x < pivot]
    mid = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return randomized_quick_sort(left) + mid + randomized_quick_sort(right)


# Example Input
arr = [10, 7, 8, 9, 1, 5]
print("Original Array:", arr)
print("Deterministic Quick Sort:", deterministic_quick_sort(arr))
print("Randomized Quick Sort:", randomized_quick_sort(arr))
print("Time Complexity: Best Case: O(n log n), Average Case: O(n log n), Worst Case: O(n^2)")
print("Space Complexity: O(n)")
