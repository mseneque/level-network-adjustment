function [w]=misclosureMatrix(n,approxRL,obs,I);
% misclosureMatrix.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  Determine the Misclosure Matrix 'w'                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for temp = 1:1:n %1 to number'n' of observations
    w(temp,1) = approxRL(obs(2,temp),1)-approxRL(obs(1,temp),1)-I(temp,1);
end

%------------------------------------------------------------------------%