%%   YOUR NAME : Caison Blake Lewis
%

%
%%factorial definition
factorial(0,1).
factorial(N,Result) :- N > 0,P is N-1,factorial(P,Q),Result is N*Q.

%%bigger definition
%bigger(X,Y,Z) is true if and only if Z is the bigger of X and Y

bigger(X,Y,X) :- X>Y.
bigger(X,Y,Y) :- Y>X.

%% Problem 1 - oddSize
%

oddSize([_]). %  base case: a list of size one is odd
oddSize([_,_|Tail]) :- oddSize(Tail). % recursive check for size n+1

%% Problem 2 - evenSize
%
evenSize([]). % base case: an empty list is of even size
evenSize([_|Tail]) :- oddSize(Tail). %recursively check for even number of elements

%% Problem 3 - isPrefix
%

isPrefix([],_). % base case: if X is an empty list, it is a prefix of any list.

% If the heads of both lists match, continue checking the tails.
% X is the head of the first list, Z is the tail of the first list,
% X is also the head of the second list, Y is the tail of the second list.
isPrefix([X|Z],[X|Y]) :- isPrefix(Z,Y).



% Problem 4 - isMember
%

isMember(X,[X|_]). % base case: X is a member of the list if it's the head of the list.
isMember(X,[_|Tail]) :- isMember(X, Tail). % check the tail of the list recursively for X


% Problem 5 - remove
%

remove(_, [], []). % Base case: empty list, remove nothing
remove(X, [X|Tail], Tail). % if the head of the list is the item to be removed, the resulting list is the tail

% If X is not the head of the list, keep the head and recursively remove X from the tail.
remove(X, [Head|Tail], [Head|Y]) :- remove(X, Tail, Y).



% Problem 6 - isUnion
%

isUnion([], Y, Y). %base case - If the first list is empty, the union is the second list itself.

% If the head of the first list is a member of the second list,
% discard it and continue with the rest of the first list
isUnion([X|Xs], Y, Z) :-
    isMember(X, Y), % Check if X is a member of Y
    isUnion(Xs, Y, Z).

% If the head of the first list is not a member of the second list,
% keep it in the result list and continue with the rest of the first list.
isUnion([X|T], Y, [X|Z]) :-
    isUnion(T, Y, Z).



% Probelm 7 - isEqual
%

isEqual([], []). % Base case: Two empty lists are equal

isEqual([X|T], Y) :-
    remove(X, Y, Rest), % Remove the first occurrence of X from Y, obtaining Rest
    isEqual(T, Rest). % Recursively check the equality of the remaining elements



% Problem 8 - isBetween
%

% base case - if the range between N1 and N2 is less than or equal to 1,
% then no numbers are between them
isBetween(N1, N2, []) :-
    N1 + 1 >= N2.

isBetween(N1, N2, [X|Tail]) :-
    N1 < N2 - 1, % make sure there is at least one number strictly between N1 and N2
    Next is N1 + 1, % Increment N1 to obtain the next number in the range
    X is Next, % X is the next number in the range
    isBetween(Next, N2, Tail). % Recursively build the list of numbers between N1 and N2




% Problem 9 - blend
%

blend([], Y, Y). % Base case: if X is empty, Z is the same as Y
blend(X, [], X). % Base case: if Y is empty, Z is the same as X

% take one element from each list and concatenate them together,
% then recursively blend the rest of the lists.
blend([X1|Xrest], [Y1|Yrest], [X1,Y1|Z]) :-
    blend(Xrest, Yrest, Z).




%
%!  ADD YOUR CODE ABOVE
%!  ADD YOUR CODE ABOVE
%!
%!  MAKE NO CHANGES BELOW
%%  MAKE NO CHANGES BELOW
%%  MAKE NO CHANGES BELOW
%%  MAKE NO CHANGES BELOW
%% Unit tests for Prolog Assignment 1
%!  %%%%%%%%
%
%

cls :- write('\33\[2J').


%% factorial
:- begin_tests(factorial).
test(factorial_test1,[true]) :- once(factorial(0, 1)).
test(factorial_test2) :- once(factorial(6,720)).
:- end_tests(factorial).

%%  max
:- begin_tests(bigger).
test(max_test1) :- once(bigger(4,2,4)).
test(max_test2) :- once(bigger(2,12,12)).
:- end_tests(bigger).

/* oddSize */
:- begin_tests(oddSize).
test(oddSize_test1) :- once(oddSize([13,21,2,101,205,9,3])).
test(oddSize_test2) :- once(oddSize([101])).
test(oddSize_test3) :- once(oddSize(['apple','ball','cat'])).
test(oddSize_test4, [fail]) :-oddSize([13,21,2,11]).
:- end_tests(oddSize).

/* evenSize */
:- begin_tests(evenSize).
test(evenSize_test1) :- once(evenSize([13,21,2,101,205,9])).
test(evenSize_test2) :- once(evenSize([])).
test(evenSize_test3) :- once(evenSize(['apple','ball','cat','dog'])).
test(evenSize_test4, [fail]) :- evenSize([13,21,2,11,82]).
:- end_tests(evenSize).

/* prefix */
:- begin_tests(isPrefix).
test(prefix_test1) :- once(isPrefix([1,2], [1,2,3,4,5])).
test(prefix_test2) :- once(isPrefix([1,2,3,4], [1,2,3,4,5])).
test(prefix_test3) :- once(isPrefix([], [1,2,3,4,5])).
test(prefix_test4,all(X==[[],[1],[1,2],[1,2,3]])) :- isPrefix(X, [1,2,3]).
test(prefix_test5, [fail]) :- isPrefix([1,2], [1,3,2,4,5]).
:- end_tests(isPrefix).

/* isBetween */
:- begin_tests(isBetween).
test(isBetween_test1) :- once(isBetween(3, 8, [4,5,6,7])).
test(isBetween_test2) :- once(isBetween(2, 9, [3,4,5,6,7,8])).
test(isBetween_test3) :- once(isBetween(1, 2, [])).
test(isBetween_test4,[fail]) :- isBetween(2, 7, [4,5,6,7]).
:- end_tests(isBetween).

/* isMember */
:- begin_tests(isMember).
test(isMember1) :- once(isMember(1, [1,2,3,4,5])).
test(isMember2) :- once(isMember(4, [1,2,13,4,5,16,7])).
test(isMember3) :- once(isMember(5, [11,21,13,41,5])).
test(isMember4, all(X==[1,2,3,20])) :- isMember(X, [1,2,3,20]).
test(isMember5, [fail]) :- isMember(100, [1,2,3,6]).
:- end_tests(isMember).

/* isUnion */
:- begin_tests(isUnion).
test(isUnion_test1) :- isUnion([3,1,2],[4,1,5,14],X), sort(X, [1,2,3,4,5,14]).
test(isUnion_test2) :- isUnion([2,1,3,4],[4,1,2,3],X), sort(X, [1,2,3,4]).
test(isUnion_test3) :- isUnion([4,2,6],[13,7,11],X), sort(X, [2,4,6,7,11,13]).
:- end_tests(isUnion).

/* isEqual */
:- begin_tests(isEqual).
test(isEqual_test1) :- once(isEqual([3,1,2],[1,2,3])).
test(isEqual_test2,[fail]) :- once(isEqual([3,1,2],[3,1,4])).
test(isEqual_test3) :- once(isEqual([1,2,3,4,5],[5,4,3,2,1])).
test(isEqual_test4) :- once(isEqual(['a','b','c'],['b','c','a'])).
:- end_tests(isEqual).

/* remove */
:- begin_tests(remove).
test(remove_test1) :- once(remove(1, [1,2,3,4], [2,3,4])).
test(remove_test2) :- once(remove(2, [1,1,2,3,2,4], [1,1,3,2,4])).
test(remove_test3) :- once(remove(11, [1,1,2,3,2,4,11], [1,1,2,3,2,4])).
test(remove_test4) :- once(remove(13, [1,1,2,3,2,4,11], [1,1,2,3,2,4,11])).
:- end_tests(remove).


/* blend */
:- begin_tests(blend).
test(blend_test1) :- once(blend([1,2],[3,4],[1,3,2,4])).
test(blend_test2) :- once(blend([1,3,5],[2,4],[1,2,3,4,5])).
test(blend_test3) :- once(blend([1,3],[2,4,6,8],[1,2,3,4,6,8])).
test(blend_test4,X==[1,2]) :- once(blend(X,[3,4],[1,3,2,4])).
test(blend_test5,X==[3,4,5]) :- once(blend([1,2],X,[1,3,2,4,5])).
:- end_tests(blend).


%% The following directives (at the shell prompt ?-) run the tests.
%% run_tests(testName). - runs the corresponding test
%% run_tests. - runs all the tests in the file

