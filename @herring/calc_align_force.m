function [ output_force ] = calc_align_force( self, target, align_dist )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
global MESSAGES
    
    target_pos = MESSAGES.pos(target,:);

    diff = self.pos - target_pos;
     dist = sqrt(sum(diff.^2));
    
    if dist < align_dist
        output_force = MESSAGES.vel(target,:);
    else
        output_force = [0.0, 0.0];
    

end

