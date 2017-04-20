function [paramCorrection,adjustedRL,approxRL]=paramCorrections(A,P,w,u,approxRL);
% paramCorrections.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Height Adjustments to the approximate RL's                %   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% parameter corrections from the least-squares equation
paramCorrection = (-(A.'*P*A)^-1)*A.'*P*w;

% Pushes the array values down so the value at position(1,1) is 0, this is 
% to accomodate for the known value in 'approxRL' at position (1,1).
% 'paramCorrectionZero' is only to be used when in use with all (u+1) 
% stations, known and unknown.
for temp = u+1:-1:2
       paramCorrectionZero(temp,1) = paramCorrection(temp-1,1);
end
paramCorrectionZero(1,1)=0;

% Shows the adjusted value ## Note: Put String description of station
% numbers on output screen
adjustedRL = approxRL + paramCorrectionZero

%------------------------------------------------------------------------%