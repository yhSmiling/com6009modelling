function [ hunt_force ] = calc_hunt_force( self, nearby_copepods )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
global MESSAGES
    if length(nearby_copepods) ~= 0
        
        if length(nearby_copepods) > 1
            closest = inf;
            for copepod = 1:length(nearby_copepods)
                target_pos = MESSAGES.pos(copepod,:);
                diff = self.pos - target_pos;
                dist = sqrt(sum(diff.^2));
                if dist < closest
                    closest = dist;
                    closest_cope = copepod;
                end
            end
            target_pos = MESSAGES.pos(closest_cope,:);
            hunt_force = seek(self, target_pos);
            
        else
            target_pos = MESSAGES.pos(nearby_copepods(1),:);
            hunt_force = seek(self, target_pos);
        end
    
    else
        hunt_force = [0.0,0.0];
    end


end

