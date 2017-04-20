% main.m
% purpose: main script file for the least squares solution
% of a level network
% Matthew Seneque 
% 25 March 2009

format short
clear all

% read input data from file
[dataRead,count]=readData('levelObs.txt');

% sets initial variables
[fixed,obs,n,I,u,U,sDev]=setVar(dataRead);

% calculates the approximate RL 'approxRL'
[approxRL]=approxRL(fixed,u,I);
  
% calculates the weight matrix 'P'
[P]=weightMatrix(sDev);

  
% Determine the Misclosure Matrix 'w'
[w]=misclosureMatrix(n,approxRL,obs,I);

% Determine the 'A' Matrix
[A]=aMatrix(n,obs);

% Height corrections from the approximate RL's 
% 'paramCorrection' & 'adjustedRL'
[paramCorrection,adjustedRL]=paramCorrections(A,P,w,u,approxRL);

% Results including residuals, adjustedObs & varianceFactor
[r,adjustedObs]=results(A,paramCorrection,w,I,P);
       

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Statistical                                 %
%                              Analysis                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variance Factor also known as standard error of an observation of unit weight
% Variance-Covariance matrix of the parameters (coVarParam) 
% Variance-Covariance matrix of the adjusted observations (coVarAdj). 
% The Standard deviation of the observed points are also calculated (stnSdev)
% Variance-Covariance matrix of the residuls (coVarResid)
% Points error bar results are (+/-) thereore length = 2*(pointErrorBar)
[varianceFactor,coVarParam,coVarAdj,coVarResid,sDev_coVarParam,sDev_coVarAdj,sDev_coVarResid,pointErrorBar]=statistics(A,P,r,n,u,sDev);

% Correclation coefficients
[corrCoef_coVarParam, corrCoef_coVarAdj, corrCoef_coVarResid] = correlationCoef(coVarParam, coVarAdj, coVarResid, sDev_coVarParam, sDev_coVarAdj, sDev_coVarResid, u, n );


%**************************** END OF FILE *********************************


