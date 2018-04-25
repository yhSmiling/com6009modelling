function [ movement_vect ] = steer( desired_vect, curr_vect )
%STEER This function limits the ability of the herring to change direction
% or velocity instantly.
%   Detailed explanation goes here

% Probably should get this from the agent
max_turning_rate = 30;
max_accel = 7;
max_speed = 15;

curr_speed = norm(curr_vect);
desired_speed = norm(desired_vect);

% This gives the angle between the two vectors in degrees.
angle_diff = acosd(dot(curr_vect, desired_vect) / (curr_speed * desired_speed));

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
speed_diff = (desired_speed-current_speed)/max_speed;
final_accel = speed_diff * max_accel;

output_speed = curr_speed + final_accel;

output_vect = output_speed * unit_vect;

desired_speed
unit_vect
output_vect


end

