function [ movement_vect ] = steer( desired_vect, curr_vect )
%STEER This function limits the ability of the herring to change direction
% or velocity instantly.
%   Detailed explanation goes here

% Probably should get this from the agent
max_turning_rate = 10; % In degrees per iteration
max_accel = 7;
max_speed = 15;

curr_speed = norm(curr_vect);
desired_speed = norm(desired_vect);

% This gives the angle between the two vectors in degrees. Value between 0
% and 180
angle_diff = acosd(dot(curr_vect, desired_vect) / (curr_speed * desired_speed));
if angle_diff > max_turning_rate
    
    current_angle = atand(curr_vect(2)/curr_vect(1));
    desired_angle = atand(desired_vect(2)/desired_vect(1));
    
    angle_diff = max_turning_rate;
    % TODO(Pierre): How do you tell whether to add or subtract angle_diff?
    if desired_angle < current_angle
        new_angle = current_angle - angle_diff;
    else
        new_angle = current_angle + angle_diff;
    end
    
    desired_vect = [(desired_speed * cosd(new_angle)), (desired_speed * sind(new_angle))];
end

if desired_speed > 0
    unit_vect = desired_vect / desired_speed;
else
    unit_vect = desired_vect;
end

if desired_speed > max_speed
    desired_speed = max_speed;
end

% NOTE(Pierre): Not really sure about this. Idea is sometimes speed diff is
% pos, sometimes it's neg. If it's big, you want to accelerate a lot (but
% not more than max_accel)
speed_diff = (desired_speed-curr_speed)/max_speed;
final_accel = speed_diff * max_accel;

output_speed = curr_speed + final_accel;

movement_vect = output_speed * unit_vect;



end

