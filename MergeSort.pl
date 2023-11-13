% Merge Sort implementation in Prolog

% Merge two sorted lists into a single sorted list
merge([], List, List).
merge(List, [], List).
merge([X|Xs], [Y|Ys], [X|Result]) :-
    X =< Y,
    merge(Xs, [Y|Ys], Result).
merge([X|Xs], [Y|Ys], [Y|Result]) :-
    X > Y,
    merge([X|Xs], Ys, Result).

% Split a list into two halves
split(List, Left, Right) :-
    length(List, Len),
    Half is Len // 2,
    length(Left, Half),
    append(Left, Right, List).

% Merge Sort
merge_sort([], []).
merge_sort([X], [X]).
merge_sort(Unsorted, Sorted) :-
    Unsorted = [_,_|_], % Make sure the list has at least two elements
    split(Unsorted, Left, Right),
    merge_sort(Left, LeftSorted),
    merge_sort(Right, RightSorted),
    merge(LeftSorted, RightSorted, Sorted).

% Example usage:
% ?- merge_sort([12, 11, 13, 5, 6, 7], Sorted).
% Sorted = [5, 6, 7, 11, 12, 13].
