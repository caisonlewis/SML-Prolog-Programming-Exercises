(* 
###################################################################################
Your name: Caison Blake Lewis

I affirm that I have not violated the
Academic Integrity policies detailed in the syllabus
###################################################################################
*)

(* SML comments appear like this *)

(* #1 - pow *)
fun pow (a, b) = if b=0 then 1 (* BASE CASE *)
	else a * pow(a,b-1); (* Recursively multiply a * a, b amount of times *)
	

(* #2 - sumTo *)
fun sumTo (x:int) = if x=0 then 0.0 (* BASE CASE *)
	else 1.0 / real(x) + sumTo(x - 1) (* Recursively calculate the sum of reciprocals. *)
               
               
(* #3 - repeat *)
fun repeat (s, n) = if n = 0 then "" (* BASE CASE *)
	else s ^ repeat(s,n-1); (* Recursively concatenates the string s, n times *)


(* #4 - binary *)
fun padZeros(s, n) =
    (* adds n zeros to the front of string s *)
    if n <= 0 then
        s
    else
        padZeros("0" ^ s, n - 1)

fun intToBinaryHelper(x, acc, count) =
    (* Converts an integer to a binary string representation *)
    if count = 16 then
        acc
    else if x mod 2 = 0 then
        intToBinaryHelper(x div 2, "0" ^ acc, count + 1)
    else
        intToBinaryHelper(x div 2, "1" ^ acc, count + 1)
		
(* check length of a list *)
fun length x = if null x then 0
		else 1 + length (tl x);
		
(* check length of a string *)
fun stringLength s = if s = "" then 0
		else 
		let val chars = explode s
in 
		length(chars)
end;
		

fun binary(x) =
        let
            val binaryString = intToBinaryHelper(x, "", 0)
            val paddedBinaryString = padZeros(binaryString, 16 - stringLength(binaryString))
        in
            paddedBinaryString
        end;



(* #5 - countNegative *)
fun countNegative x = if null x then 0 (* BASE CASE *)
	else if hd x < 0 then 1 + countNegative (tl x) (* Recursively checks if each integer in the given list is negative and adds 1 for each negative integer *) 
	else countNegative(tl x); (* continue past non-negatives without adding 1 *)


(* #6 - absList *)
fun absTuple(x:int,y:int) = (abs(x),abs(y)); (* finds absolute value of a given integer tuple *)

fun absList x = if null x then nil (* BASE CASE *)
	else absTuple(hd x) ::absList(tl x); (* Recursively finds the absolute value of each integer tuple in a given list and adds them to a newly created integer tuple list *)


(* #7 - split *)
fun splitInt n = if n mod 2 = 0 then (n div 2, n div 2) (* BASE CASE: Check if the integer is evenly divisble *)
    else (n div 2, n div 2 + 1); (*If integer is not evenly divisble make the second integer the bigger number when split*)

fun split x = if null x then nil (* BASE CASE *)
	else splitInt(hd x) ::split(tl x); (* Recursivly splits each integer using the helper method and returns a new list of the tuples split from each integer *)


(* #8 - isSorted *)

(* check length of a list *)
fun length x = if null x then 0
		else 1 + length (tl x);
		
fun isSorted x = if null x then true
	else if length(x) = 1 then true
	else if hd x <= hd (tl x) then isSorted (tl x)
	else false;

 
(* #9 - collapse *) 
fun collapse x = if null x then nil
	else if length(x) = 1 then x
	else (hd x + hd (tl x)) :: collapse(tl(tl x));
	

        
(* #10 - insert *)        
fun insert (n, x) = [];

(* #11 - decimal *)
fun decimal (s:string) = 0;
