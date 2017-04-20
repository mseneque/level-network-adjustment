function [A]=aMatrix(n,obs);
% aMatrix.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Determine the 'A' Matrix                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for temp = 1:1:n
    A(temp,obs(2,temp)) = obs(2,temp)^0;
    A(temp,obs(1,temp)) = -obs(1,temp)^0;
end
% removes the first column from the matrix created (1st column is uneeded 
% because this represents station 1 which is of known value. Now the with 
% of the matrix is the number of the unknowns 'u', and the length is the 
% number of the observations 'n'.
A(:,1)=[];

%------------------------------------------------------------------------%