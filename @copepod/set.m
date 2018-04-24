function c=set(c,prop_name,val)

%standard function to allow insertion of memory parameters from copepod object

switch prop_name

case 'pos'
   c.pos = val;
case 'vel'
   c.vel = val;
case 'max_speed'
    c.max_speed = val;
case 'burst_speed'
     c.burst_speed = val;
     
otherwise 
   error('invalid field name')
end

