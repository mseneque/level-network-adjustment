function [fixed,obs,n,I,u,U,sDev]=setVar(dataRead);
% setVar.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  Sets the initial working variables                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Splits the text file into two separate arrays; One for the fixed data; 
% One for the observed data.
fs = size(dataRead); 
fixed = dataRead(1,1);
for temp = 2:1:(fs(1,2))
   obs(:,(temp-1)) = dataRead(:,temp);
end
%------------------------------------------------------------------------%

% determines the number of the observations 'n' & the observation vector 'I'
n = size(obs); n = n(1,2);
I = obs(3,:).';
   
% determines the number of the unkmown stations 'u' & creates the unknown
% vector 'U'
u = max(obs(1,:)) - 1;

for temp = 1:1:(u)  %repeats to the number of unknowns
    U(1,(temp))=temp+1; 
end
U = U.'; %transpose array 

% calculates standard deviation(mm) from the observation leg lengths(km).
sDev = ((2.5*sqrt(obs(4,:)))/1000).'  %divide by 1000 convert mm to m

%------------------------------------------------------------------------%