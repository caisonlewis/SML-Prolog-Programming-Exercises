(* 
###################################################################################
Your name: Caison Blake Lewis

I affirm that I have not violated the
Academic Integrity policies detailed in the syllabus
###################################################################################
*)

(* #1 - quicksort *)
fun quicksort([]) = nil  (* Base case: an empty list is already sorted. *)
  | quicksort(pivot::xs) =
      let
        (* Partition helper function *)
        fun partition([], less, greater) = (less, greater) (*base case*)
          | partition(y::ys, less, greater) =
              if y < pivot then
                partition(ys, y::less, greater)  (* Element is less than the pivot, add to 'less'. *)
              else
                partition(ys, less, y::greater)  (* Element is greater or equal to the pivot, add to 'greater'. *)
      in
        let
          val (less, greater) = partition(xs, [], [])  (* Partition the list into 'less' and 'greater' sublists. *)
        in
          quicksort(less) @ [pivot] @ quicksort(greater)  (* Recursively sort 'less' and 'greater' and combine with the pivot. *)
        end
      end;


(* #2 - member *)
(* test whether a given element is a member of a given set *)
fun member(_, nil) = false (*base case: if the given set is empty then any given element is not a part of that set *)
| member(e, head::tail) = e = head orelse member (e, tail); (*recursively compare the head of the set with the given element *)
               
               
(* #3 - returns the union of sets (lists) s1 and s2*)
(* You may assume that s1 and s2 do not have any duplicate elements *)
fun union([], s2) = s2  (* Base case: If the first set is empty, the union is the second set. *)
  | union(s1, []) = s1  (* Base case: If the second set is empty, the union is the first set. *)
  | union (h::t, s2) = if member(h, s2) then union(t, s2)  (* skip elements that belong to both sets *)
    else h :: union(t, s2); (*recursively adds the last element of the first set to the head of the second set until the tail (t) of the first set is nill *)


(* #4 - returns the intersection of sets (lists) s1 and s2 *)
(* You may assume that s1 and s2 do not have any duplicate elements *)
fun intersection ([], s2) = nil (* base case: if the first set is empty, the intersection is nil *)
  | intersection (s1, []) = nil (* base case: if the second set is empty, the intersection is nil *)
    (* recursively checks if the last element of the first set is a memeber of the second set, if not skip it *)
  | intersection (h::t, s2) = if member(h,s2) then h :: intersection(t, s2) else intersection(t,s2);

(* #5 - Return list of integers from start (inclusive) to stop (exclusive) by step *)
fun range(start, stop, step) =
    let
        fun rangeHelper(current, acc) = 
		(* recursively adds the each step to the current value (starting with the start value) until the stopping point is reached whilst combining each recursive list of results *)
            if (step > 0 andalso current >= stop) orelse (step < 0 andalso current <= stop) then
                acc
            else
                rangeHelper(current + step, acc @ [current]) (* increment by the step and combine the lists *)
			in
				rangeHelper(start, [])
	end;

(* #6 - Return a slice of a list between indices start inclusive, and stop exclusive. Assume first element of list is at index 0*)
fun slice(aList, start, stop) =
    let
        fun sliceHelper([], _, _, _) = nil (* Base case: an empty list *)
          | sliceHelper(h::t, currentIndex, startIdx, stopIdx) =
            if currentIndex < startIdx then
                (*get to the starting point for slicing *)
                sliceHelper(t, currentIndex + 1, startIdx, stopIdx)
            else if currentIndex >= startIdx andalso currentIndex < stopIdx then
                h::sliceHelper(t, currentIndex + 1, startIdx, stopIdx) (*increment recursively until stopping point is reached *)
            else
                [];
    in
        sliceHelper(aList, 0, start, stop) (*start pointer at index zero *)
    end;
	


(* #7 - binary search *)

(* helper for middle *)
fun divide(first, second) =
  if null(tl second) then hd first (* check if the list has just one element, if so return that element *)
else if null(tl(tl(second))) then hd (tl first)      (* if the list has two elements, return the second element *)                       
  else 
(* Otherwise, recursively call divide with tail of first list and skipping two elements in second list *)
    divide(tl first, tl(tl(second)));

(* get middle element in list *)
fun mid([a]) = a (*base case: 1 element list, the middle is the single element *)
  | mid(lst) = divide(lst,lst); (*use the helper method *)


fun binarySearch(sortedList, value) =
    let
        fun binarySearchHelper(lst, start, stop) =
            if start >= stop then
                false (* Base case: value not found *)
            else
                let
                    val midElement = mid(slice(lst, start, stop)) (* Get the middle element *)
                in
                    if midElement = value then
                        true (* Value found *)
                    else if midElement > value then
                        binarySearchHelper(lst, start, start + (stop - start) div 2) (* Recursively Search left half *)
                    else
                        binarySearchHelper(lst, start + (stop - start) div 2 + 1, stop) (* Recursively Search right half *)
                end
    in
        binarySearchHelper(sortedList, 0, length(sortedList))
    end;
