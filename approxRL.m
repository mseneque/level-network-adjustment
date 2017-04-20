function [approxRL]=approxRL(fixed,u,I);
% approxRL.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  Calculates the approximate heights                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This will calculate the approximate heights from stations 1 to 'u+1' 
% i.e. 1 to (number of stations)
% This assumes that the stations are of incrementing order of observations.

% Fixed height value
approxRL(1,1) = fixed;

% Creates the new array entry 'approxRL' by adding the corresponding 
% observation vector of height differences to the previous array entry of 
% 'approxRL'. 
for temp = 2:1:(u+1)
   approxRL(temp,1) = approxRL((temp-1),1) + I((temp-1),1);
end
%------------------------------------------------------------------------%

