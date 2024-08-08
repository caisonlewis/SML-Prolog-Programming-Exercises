(* 
###################################################################################
Your name: Caison Blake Lewis

I affirm that I have not violated the
Academic Integrity policies detailed in the syllabus
###################################################################################
*)

(* #1 - duplist *)
(* take list as input, out put same list with two of each element (duplicated) *)
fun duplist x = foldr (fn (a,b) => a::a::b) [] x;

(* #2 - mylength *)
(* return length of a list *)
fun mylength x = foldl (fn (_,b)=> b+1) 0 x;

(* #3 - il2absrl *)
(* convert integer list (input) to the absolute value of those integers, converted to reals *)
fun il2absrl x = map (fn x => real(abs x)) x;

(* #4 - myimplode *)
(* takes char list, outputs string of those characters in order *)
fun myimplode x = foldr (fn (a,b) => (str a) ^b) "" x;

(* #5 - lconcat *)
(* takes a list of lists as Input and returns the list formed by appending the input
lists together in order *)
fun lconcat x = foldr (fn (a,b)=> a@b) [] x;

(* #6 - convert *)
(*  converts a list of pairs into a pair of lists, preserving the order of the elements *)
fun convert x = foldr (fn ((a,b), (c,d)) => (a::c, b::d)) ([],[]) x;

(* #7 - mymap *)
(* base case: any empty list will return an empty list no matter the function, 
otherwise split the list and apply the function recursively through the list *)
fun mymap f nil = nil | mymap f (first::rest) = f(first)::mymap f rest;

(* #8 - myfoldl *)
(* base case: any function operation with an empty list and the initail value will result in the initial value,
otherwise the list is split and the function is applied to the current value in the list (a) and the initial value (b), the initial value (b) will be the result of the function between a and b with each recursive call *)
fun myfoldl f init nil = init
  | myfoldl f init (first::rest) = myfoldl f (f(first, init)) rest;


(* #9 - sumSome *)
(* base case: the sum of an empty list no matter the function condition will be zero,
otherwise the list is split the condition checks the current head (first) if true then each subseqent value stated true from the function is recursively summed, however if the function results in false with the given value during recursion, that value is not summed. *)
fun sumSome f nil = 0
  | sumSome f (first::rest) =  if f(first) then first + sumSome f rest else sumSome f rest;