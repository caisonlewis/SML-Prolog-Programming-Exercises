(* sum of values in a list *)
fun listsum x = if null x then 0
		else hd x + listsum(tl x);

(* check length of a list *)
fun length x = if null x then 0
		else 1 + length (tl x);
		

(* reverse a list *)
fun reverse x = if null x then nil
		else reverse(tl x) @ [hd x];
		
(* increment (by one) each item in a given list into a new list *)
fun inc x = if null x then nil
		else hd x+1 ::inc (tl x);
		
(* rotate list left, the head becomes the tail *)
fun rotate_left x = if null x then nil
		else tl x @ [hd x]; 
		