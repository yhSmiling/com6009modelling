function [] = drawArrow( x,y )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0 )

end
