function [corrCoef_coVarParam, corrCoef_coVarAdj, corrCoef_coVarResid] = correlationCoef(coVarParam, coVarAdj, coVarResid, sDev_coVarParam, sDev_coVarAdj, sDev_coVarResid, u, n )
%  correlationCoef.m


% Correlation coefficient of the variance-covariances of the parameters 
% (corrCoef_coVarParam)
col = 1;
row = 1;

for col = 1:1:u
    corrCoef_coVarParam(row,col) = coVarParam(row,col)/(sDev_coVarParam(row,1)*sDev_coVarParam(col,1)); 
       for row = 1:1:u
           corrCoef_coVarParam(row,col) = coVarParam(row,col)/(sDev_coVarParam(row,1)*sDev_coVarParam(col,1));
       end    
end

% Correlation coefficient of the variance-covariances of the adjusted observations
% (corrCoef_coVarAdj)
col = 1;
row = 1;

for col = 1:1:n
    corrCoef_coVarAdj(row,col) = coVarAdj(row,col)/(sDev_coVarAdj(row,1)*sDev_coVarAdj(col,1)); 
       for row = 1:1:n
           corrCoef_coVarAdj(row,col) = coVarAdj(row,col)/(sDev_coVarAdj(row,1)*sDev_coVarAdj(col,1));
       end    
end

% Correlation coefficient of the variance-covariances of the residuls
% (corrCoef_coVarResiduls)
col = 1;
row = 1;

for col = 1:1:n
    corrCoef_coVarResid(row,col) = coVarResid(row,col)/(sDev_coVarResid(row,1)*sDev_coVarResid(col,1)); 
       for row = 1:1:n
           corrCoef_coVarResid(row,col) = coVarResid(row,col)/(sDev_coVarResid(row,1)*sDev_coVarResid(col,1));
       end    
end