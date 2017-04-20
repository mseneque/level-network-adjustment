function [varianceFactor,coVarParam,coVarAdj,coVarResid,sDev_coVarParam,sDev_coVarAdj,sDev_coVarResid,pointErrorBar]=statistics(A,P,r,n,u,sDev);

% Compute the estimated variance factor
% Standard error of an observation of unit weight
varianceFactor = (r.'*P*r)/(n-u)  %***************** Page 251 reference for report **************************************************** <<<<<<<<<<<<<<<<<<<
                                  %   can create hypothosis test chi^2
                                  %   (m-n) degrees of freedom

%------------CoVariance ----------------          

% Cx^ covariance of the paramaters
coVarParam = (A.'*P*A)^-1;

% Cl^ covariance of the adjusted observations
coVarAdj = A*((A.'*P*A)^(-1))*(A.');

% Variance-Covariance matrix of the residuls (coVarResid)
coVarResid = diag((sDev.^2)) - coVarAdj 

%-------------Standard deviations-------

% Standard deviation of stations / parameters
sDev_coVarParam = diag(coVarParam).^(0.5)

% Standard deviation of adjusted observations
sDev_coVarAdj = diag(coVarAdj).^(0.5)

% Standard deviation of the residuls
sDev_coVarResid = diag(coVarResid).^(0.5)

%-------------Point error bar-----------

% Point error bar at 95% confidence level 
% length of bar is  =  2*(pointErrorBar)
pointErrorBar = sDev_coVarParam .* 1.96
