function loc_agents = extract_local_live_agents(agent,sense_radius)

%Extracts array representing distribution of food available in the local
%area of an agent at position cpos [x,y] and with search radius =spd.
%This function also makes corrections in the case that the agent is close
%to the model edge

global ENV_DATA MESSAGES

pos = get(agent, 'pos');

% NOTE(Pierre): Maybe we need to feed in a list of possible candidates (i.e.
% via some sort of quadtree), rather than checking the distance to all
% other agents?
typ=MESSAGES.atype;                                         %extract types of all agents
cpds=find(typ==1|typ==2);                                    %indices of all herring + copepods (live + dead)
cpos=MESSAGES.pos(cpds,:);                                     %extract positions of all copepods
csep=sqrt((cpos(:,1)-pos(:,1)).^2+(cpos(:,2)-pos(:,2)).^2);

%ENV_DATA is a data structure containing information about the model
   %environment
   %    ENV_DATA.shape - shape of environment - FIXED AS SQUARE
   %    ENV_DATA.units - FIXED AS KM
   %    ENV_DATA.bm_size - length of environment edge in km
   %    ENV_DATA.food is  a bm_size x bm_size array containing distribution
   %    of food

if cpos(1)>ENV_DATA.bm_size-sense_radius
    xmax=ENV_DATA.bm_size;
else
    xmax=cpos(1)+sense_radius;
end
if cpos(1)<sense_radius+1
    xmin=1;
else
    xmin=cpos(1)-sense_radius;
end
if cpos(2)>ENV_DATA.bm_size-sense_radius
    ymax=ENV_DATA.bm_size;
else
    ymax=cpos(2)+sense_radius;
end
if cpos(2)<sense_radius+1
    ymin=1;
else
    ymin=cpos(2)-sense_radius;
end

loc_agents= "Hey, here's a list of agents, guys!";    %extract distribution of food within the local search radius

