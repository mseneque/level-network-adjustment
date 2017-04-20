function [r,adjustedObs]=results(A,paramCorrection,w,I,P);
% results.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 Residuals and the adjusted observations                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% residuals
r = A*paramCorrection+w;

% adjusted observations (true observations 'I' plus residuals 'r')
adjustedObs = I + r;

%------------------------------------------------------------------------%

