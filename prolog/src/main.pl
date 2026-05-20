padre(tom, bob).
padre(tom, liz).
padre(bob, ann).

abuelo(X, Z) :- padre(X, Y), padre(Y, Z).