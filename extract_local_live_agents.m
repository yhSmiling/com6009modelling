function loc_agents = extract_local_live_agents(agent,sense_radius)

%Extracts array representing distribution of food available in the local
%area of an agent at position cpos [x,y] and with search radius =spd.
%This function also makes corrections in the case that the agent is close
%to the model edge

global MESSAGES

pos = get(agent, 'pos');
% NOTE(Pierre): Maybe we need to feed in a list of possible candidates (i.e.
% via some sort of quadtree), rather than checking the distance to all
% other agents? Also, we want to only find OTHER agents, not the current
% agent. How to do this?
typ=MESSAGES.atype;                                         %extract types of all agents
liveagents=find(typ==1|typ==2);                                    %indices of all herring + copepods (live + dead). TODO(Pierre): Is this actually getting copepods?
cpos=MESSAGES.pos(liveagents,:);                                     %extract positions of all copepods
csep=sqrt((cpos(:,1)-pos(:,1)).^2+(cpos(:,2)-pos(:,2)).^2);
within_radius = zeros(size(csep));
for i = 1:length(csep)
    if csep(i) > sense_radius
        within_radius(i) = 0;
    elseif csep(i) == 0 % This is probably a dodgy and slow way of making the agent ignore itself. Maybe there's a way to pre-filter liveagents? Where is the agent index stored? We could feed it into this func?
        within_radius(i) = 0;
    else
        within_radius(i) = 1;
    end
end
% within_radius has 1s at the indexes where other agents are.
% NOTE(Pierre): We could use logical indexing to get all of the data out,
% using this array feature. It acts like a mask. Like A = [14,25,3] B =
% [1,0,1] A(B) = [14,3]
% localsep = csep(logical(within_radius))


loc_agents = liveagents(logical(within_radius));

