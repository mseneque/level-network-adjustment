function [dataRead,count]=readData(filename);
% readData.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  Reads in the data from the textfile                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Text file format should be:
%           From  To   H_Diff  L(km)
%   """"""""""""""""""""""""""""""""""          
%   "  'Fixed_RL'  0   0       0     "
%   "          1   2   5.666   1.5   "          
%   "          2   3   48.025  2.5   "
%   "          3   4   3.021   2     "   Consecutive increments 'From'&'To' 
%   "         'n''n+1' -13.987 3     "<- to final station 'n+1' 
%   "         'x' 'y' 'H_Diff''L'    "<- x & y can be any extra observations                   
%   "                                "   within the set { 1 < x,y < n+1} 
%   """"""""""""""""""""""""""""""""""

fid=fopen('levelObs.txt','rt');
[dataRead,count]=fscanf(fid,'%f',[4,inf])

%------------------------------------------------------------------------%

