function [ movement_vect ] = steer( desired_vect, curr_vect )
%STEER This function limits the ability of the herring to change direction
% or velocity instantly.
%   Detailed explanation goes here

% Probably should get this from the agent
max_turning_rate = 30;
max_acceleration = 7;
max_speed = 15;
curr_speed = norm(curr_vect);


desired_speed = norm(desired_vect);

if desired_speed > max_speed
    desired_speed = max_speed;
    
if desired_speed > 0
    unit_vect = desired_vect / desired_speed;
else
    unit_vect = desired_vect;
end


end

