class
    APPLICATION

create
    make

feature {NONE} -- Initialization

    make
            -- Run merge sort.
        local
            a: ARRAY[INTEGER]
        do
            create a.make_filled(0, 1, 10)
            a.put(38, 1)
            a.put(27, 2)
            a.put(43, 3)
            a.put(3, 4)
            a.put(9, 5)
            a.put(82, 6)
            a.put(10, 7)
            a.put(6, 8)
            a.put(14, 9)
            a.put(22, 10)
            print ("Original array: " + a.out + "%N")
            merge_sort(a)
            print ("Sorted array: " + a.out + "%N")
        end

feature -- Basic operations

    merge_sort (a: ARRAY[INTEGER])
        -- Sort 'a' using merge sort algorithm.
        local
            n, middle: INTEGER
            left, right: ARRAY[INTEGER]
        do
            n := a.upper
            if n > 1 then
                middle := n // 2
                create left.make_filled(0, 1, middle)
                create right.make_filled(0, 1, n - middle)
                across 1 |..| middle as i loop
                    left.put(a.item(i.item), i.item)
                end
                across (middle + 1) |..| n as i loop  -- Corregido aquí
                    right.put(a.item(i.item), i.item - middle)
                end
                merge_sort(left)
                merge_sort(right)
                merge(a, left, right)
            end
        end

    merge (a, left, right: ARRAY[INTEGER])
        -- Merge two sorted arrays 'left' and 'right' into 'a'.
        local
            n_left, n_right, i, j, k: INTEGER
        do
            n_left := left.upper
            n_right := right.upper
            i := 1
            j := 1
            k := 1
            from
            until i > n_left and j > n_right loop
                if i > n_left then
                    a.put(right.item(j), k)
                    j := j + 1
                elseif j > n_right or else left.item(i) <= right.item(j) then
                    a.put(left.item(i), k)
                    i := i + 1
                else
                    a.put(right.item(j), k)
                    j := j + 1
                end
                k := k + 1
            end
            if i <= n_left then
                from until i > n_left loop
                    a.put(left.item(i), k)
                    i := i + 1
                    k := k + 1
                end
            elseif j <= n_right then
                from until j > n_right loop
                    a.put(right.item(j), k)
                    j := j + 1
                    k := k + 1
                end
            end
        end
end -- class APPLICATION