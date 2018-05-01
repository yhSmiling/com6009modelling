function [ output_args ] = rand_between( low, high )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
  output_args = rand(1)*(low-high)+high;

end

