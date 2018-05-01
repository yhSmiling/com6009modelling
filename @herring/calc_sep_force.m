function [ output_force ] = calc_sep_force( self, target, desired_sep )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
global MESSAGES
    
    target_pos = MESSAGES.pos(target);
%     cat = desired_sep
%     self_pos = self.pos
    
    % Something is wrong with this. Only one dimension???
%     target_pos
%     diff = self.pos - target_pos
%     dist = sqrt(sum(diff.^2))
    
    if dist < desired_sep
        % TODO: Do we need to normalize?
        output_force = norm(diff)/dist
    else
        output_force = [0.0, 0.0]
    

end

