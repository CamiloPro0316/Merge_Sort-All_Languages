(defun merge-lists (list1 list2)
  "Merge two sorted lists into one sorted list."
  (cond ((null list1) list2)
        ((null list2) list1)
        ((<= (first list1) (first list2))
         (cons (first list1) (merge-lists (rest list1) list2)))
        (t
         (cons (first list2) (merge-lists list1 (rest list2))))))

(defun merge-sort (list)
  "Sort a list using the merge sort algorithm."
  (if (or (null list) (null (rest list)))
      list
      (let ((half (floor (length list) 2)))
        (merge-lists (merge-sort (subseq list 0 half))
                     (merge-sort (subseq list half))))))

(defun main ()
  "Main function to execute the merge sort program with predefined input."
  (format t "Welcome to the Lisp Merge Sort Program!")
  (let ((numbers '(3 1 4 1 5 9 2 6 5 3 5)))
    (format t "~%Predefined List: ~a" numbers)
    (format t "~%Sorted List: ~a" (merge-sort numbers))))

; Start the program
(main)