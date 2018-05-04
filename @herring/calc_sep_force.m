function [ output_force ] = calc_sep_force( self, target, desired_sep )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
global MESSAGES
    
    target_pos = MESSAGES.pos(target,:);
     separation = desired_sep;
     self_pos = self.pos;
    
     diff = self.pos - target_pos;
     dist = sqrt(sum(diff.^2));
    
    if dist < desired_sep
        % TODO: Do we need to normalize?
        normalized = diff/norm(diff);
        % Making it stronger the closer they are
        output_force = normalized./dist;
    else
        output_force = [0.0, 0.0];
    

end

