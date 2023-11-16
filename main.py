from MergeSort import MergeSort
import copy
if __name__ == "__main__":
    unsorted_array:list = [12, 11, 13, 5, 6, 7]
    copy_unsorted_array:list = copy.copy(unsorted_array)
    
    merge_sort_instance:MergeSort = MergeSort(copy_unsorted_array)
    merge_sort_instance.merge_sort()
    sorted_array:MergeSort = merge_sort_instance.get_sorted_array()
    
    print("Unsorted array:", unsorted_array)
    print("Sorted array:", sorted_array)

