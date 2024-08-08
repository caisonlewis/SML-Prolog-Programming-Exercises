/*
 * Caison Blake Lewis
 * [a,b] - represents a problem state with a gallons in the 4-gallon jug
 * and b gallons in the 3-gallon jug
 */

%% You can fill the 4 gallon jug from the faucet, taking you from a
%% problem state [X,Y] to a problem state [4,Y],
%% provided X < 4.
move([X,Y],'Top off 4-gallon jug from faucet',[4,Y]) :- X<4.
%%
%
%2. Rule corresponding to the move 'Top off 3-gallon jug from faucet'
%
move([X,Y], 'Top off 3-gallon jug from faucet', [X,3]) :- Y<3.
%
%3. Rule corresponding to the move 'Empty 4-gallon jug onto the ground'
%
move([X,Y], 'Empty 4-gallon jug onto the groud', [0,Y]) :- X>0.
%
%4. Rule corresponding to the move 'Empty 3-gallon jug onto the ground'
%
move([X,Y], 'Empty 3-gallon jug onto the ground', [X,0]) :- Y>0.
%
% 5. Rule corresponding to the move 'Top off 4-gallon jug from 3-gallon
% jug'
%
move([X,Y], 'Top off 4-gallon jug from 3-gallon', [Newx,Newy]) :-
    Y>0, X<4,
    Needed is 4-X,
    Newx is X + Needed,
    Newy is Y - Needed.

% 6. Rule corresponding to the move 'Top off 3-gallon jug from 4-gallon
% jug'
%
move([X,Y], 'Top off 3-gallon jug from 4-gallon jug', [Newx,Newy]) :-
    X>0, Y<3,
    Needed is 3-Y,
    Newy is Y + Needed,
    Newx is X - Needed.

%
%7. Rule corresponding to the move 'Empty 3-gallon jug into 4-gallon jug'
%
move([X,Y], 'Empty 3-gallon jug into 4-gallon jug', [Newx,Newy]) :-
    X=<4-Y, Y>0,
    Newx is X+Y,
    Newy is 0.
%
%8. Rule corresponding to the move 'Empty 4-gallon jug into 3-gallon jug'
move([X,Y], 'Empty 4-gallon jug into 3-gallon jug', [Newx,Newy]) :-
    X=<3, Y=<3-X,
    Newx is 0,
    Newy is Y+X.

%
%
%%solution predicates
% To solve the problem try this: length(X, Y), Y < 10, solution([0,0], X).
%
% [2,0] is the goal state. No move required if you are in this state
solution([2,0],[]).
%
%The list of moves [Move|Rest] constitutes a solution from PresentState
%if Move takes you from PresentState to NextState
%and Rest represents a sequence of moves that will take
%you from NextState to the goal state.
solution(PresentState,[Move|Rest]) :- move(PresentState,Move,NextState),
    solution(NextState,Rest).


