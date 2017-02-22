% Tutorials

format long % Output is formatted in the long format
vpa(pi) % vpa allows the precision to increase. NOT IN OCTAVE
clc % Clears the screen

sin(vpa(pi, 100)) % as opposed to vpa(sin(pi), 100)

%% ----------------------------------------------------------------------------
%% EXAMPLE: VERIFYING LIMITS
%% ----------------------------------------------------------------------------

%% Verify the limit (1-cos(x))/x^2 = 1/2
format compact

dx = 10.^(-1:-1:-9)
vpa_dx = vpa(dx) % 32 digits
(1 - cos(dx))./dx.^2

%% ----------------------------------------------------------------------------
%% SYMBOLIC MATH TOOLBOX
%% ----------------------------------------------------------------------------

% Symbolic limit 
syms x % Convert x into a symbolic variable
limit((1-cos(x))/x^2,x,0)

% Symbolic Integrals
syms x
int(1/sqrt(1+x^2), x, 0, 1) % Integral between 0 and 1
int(1/(1+x^2), x, -inf, inf) % Between -infinity and +infinity

% Symbolic Differentiation
syms x
diff(log(1+x), x)
diff(log(1+x), x, 3)

% Taylor Expansion
syms x
taylor(exp(x), x)
taylor(exp(x), x, 1) % Where x = 1
taylor(exp(x), x, 'order', 10) % Up to the 10th order

%% ----------------------------------------------------------------------------
%% Approaches to solving combination problems
%% ----------------------------------------------------------------------------

% If we want to see the combinations of coins which can make a given amount of
% money, we have three options

% 1. List and count
% 2. Recursion

% 3. Using a generation function 

syms x
f = (1-x)*(1-x^2)*(1-x^5)*(1-x^10)*(1-x^20)*(1-x^50)*(1-x^100)*(1-x^200)
f = 1/f
taylor(f,x)
taylor(f, x, 'order', 201)

%% ----------------------------------------------------------------------------
%% Symbolic sum and product
%% ----------------------------------------------------------------------------

syms x a b c
solve(a*x^2 + b*x + c == 0, x) % Second parameter is what we want to solve for

% Symbolic Sum
syms n k
symsum(k, k, 1, n)

% Sum of inverse square of integers
symsum(1/n^2, n, 1, inf)