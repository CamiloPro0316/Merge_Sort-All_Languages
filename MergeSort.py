class MergeSort:
    def __init__(self, array):
        self.array = array

    def merge_sort(self):
        if len(self.array) > 1:
            mid = len(self.array) // 2
            left_half = self.array[:mid]
            right_half = self.array[mid:]

            left_merge_sort = MergeSort(left_half)
            right_merge_sort = MergeSort(right_half)

            left_merge_sort.merge_sort()
            right_merge_sort.merge_sort()

            i = j = k = 0

            while i < len(left_half) and j < len(right_half):
                if left_half[i] < right_half[j]:
                    self.array[k] = left_half[i]
                    i += 1
                else:
                    self.array[k] = right_half[j]
                    j += 1
                k += 1

            while i < len(left_half):
                self.array[k] = left_half[i]
                i += 1
                k += 1

            while j < len(right_half):
                self.array[k] = right_half[j]
                j += 1
                k += 1

    def get_sorted_array(self):
        return self.array


# Example usage:
if __name__ == "__main__":
    unsorted_array = [12, 11, 13, 5, 6, 7]
    merge_sort_instance = MergeSort(unsorted_array)
    merge_sort_instance.merge_sort()
    sorted_array = merge_sort_instance.get_sorted_array()

    print("Unsorted array:", unsorted_array)
    print("Sorted array:", sorted_array)
