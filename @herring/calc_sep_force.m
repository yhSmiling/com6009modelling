function [ output_args ] = calc_sep_force( self, target )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
global MESSAGES

    pos = MESSAGES.pos(target);
    vel = MESSAGES.pos(target);
    output_args = vel

end

