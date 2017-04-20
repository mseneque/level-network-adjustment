function [P]=weightMatrix(sDev);
% weightMatrix.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Formulate the Weight Matrix 'P'                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creates a diagonal matrix with the array of squared standard deviations 
% (variances) of the observations 'sDev', then inverses the results to form
% the weight matrix 'P'
P = diag((sDev.^2))^-1;  

%------------------------------------------------------------------------%