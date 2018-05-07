function [agt]=migrate(agt,cn)

%migration functions for class copepod(modified by HE YANG)


global ENV_DATA IT_STATS N_IT 
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%interpolated to each grid point
%ENV_DATA is a data structure containing information about the model
   %environment
   %    ENV_DATA.shape - shape of environment - FIXED AS SQUARE
   %    ENV_DATA.units - FIXED AS KM
   %    ENV_DATA.bm_size - length of environment edge in km
   %    ENV_DATA.food is  a bm_size x bm_size array containing distribution
   %    of food

mig=0;                               %indicates whether copepod has successfully migrated
pos=agt.pos;                         %extract current position 
cpos=round(pos);                     %round up position to nearest grid point   
spd=agt.speed;                       %copepod migration speed in units per iteration - this is equal to the food search radius
Visual=2.5
delta=0.618

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This function reduces the computational overhead. Only LOCAL area
%is searched for food, as opposed to entire environment
%loc_food is food distribution in local search area
%xmin in minimum x co-ord of this area
%ymin is minimum y co-ord of this area
[loc_food,xmin,ymin]=extract_local_food(cpos,spd);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
mig=0;                          %flag will be reset to one if copepod migrates   兔子觅食
[xf,yf]=find(loc_food);        %extract all rows (=x) and columns (=y) of food matrix where food is present
 if ~isempty(xf)      
     xa=xmin+xf-1;                  %x co-ordiantes of all squares containing food
     ya=ymin+yf-1;                  %y co-ordiantes of all squares containing food
     csep=sqrt((xa-pos(:,1)).^2+(ya-pos(:,2)).^2);   %calculate distance to all food  计算兔子与食物之间的距离
     [d,nrst]=min(csep);     %d is distance to closest food, nrst is index of that food  选取最近的食物点
     if d<=spd       %if there is at least one lot of food within the search radius        
         if length(nrst)>1       %if more lot of food located at same distance then randomly pick one to head towards
             s=round(rand*(length(nrst)-1))+1;
             nrst=nrst(s);
         end
         nx=xa(nrst)+rand-0.5;
         ny=ya(nrst)+rand-0.5;
         disp(nx)
         npos=[nx ny];
         %if agent has left edge of model, then adjust slightly
         shft=find(npos>=ENV_DATA.bm_size);
         npos(shft)=ENV_DATA.bm_size-rand;
         shft=find(npos<=1);
         npos(shft)=1+rand;
         mig=1;
     end
 end
 

 %This method lack of function that store the positions of total copepod.As
 %for the other 2 method, I will modified in daytime 7th May.
 %following behaviour: The surrounding partner has a maximum value and is not crowded nearby, moving towards its partner
 for i=1:cn %Iterative all survial agents 
     postion_copepod=agt.pos; %get the position of copepod.
     temp_maxY=-inf
     for j =1:cn 
         position_other_copepod = agt.pos;%find other copepod (lack ways to find other fish locations in school,update it in daytime 7th May)
         if((norm(position_other_copepod-postion_copepod)<Visual) && (maxf(position_other_copepod)>temp_maxY))% if the school of copepod within Visual distance
             temp_maxX=position_other_copepod;
             temp_maxY=maxf(position_other_copepod)
         end
     end
     nf2=0;
     for j=1:N
         position_other_copepod=agt.pos;
         if(norm(position_other_copepod-temp_maxX)<Visual)
             nf2=nf2+1;%%If the fish is in the visible range of a single fish, the number increases by one.
         end
     end
     nf2=nf2-1%To remove himself, the number of the periphery is reduced by one because the fish is already in the fish school.
     if((temp_maxY/nf2)>delta*maxf(postion_copepod) && (norm(temp_maxX-postion_copepod)~=0))%There is the largest fish school nearby, and it is not too crowded
         XXR2=rand*Step*(temp_maxX-postion_copepod)/norm(temp_maxX-postion_copepod);
         XXnext2=postion_copepod+XXnext2;
         mig=1;%the copepod moved
         temp_y_XXnext2=maxf(XXnext2);
     else
         mig=0 % copepod not move
         temp_y_XXnext2=-inf;
     end
 end
  
 
 
 
 
 
 
% if mig==0
%     xa=xmin+xf-1;
%     ya=ymin+yf-1;
%     X=[xa,ya];
%     label_follow =0;
%     temp_maxY = -inf;
%     for i=1:agt.cn;
%         XX_2=[X(i,1),x(i,2)];
%         if((norm(XX_2-X)<Visual) && (maxf(XX_2)>temp_maxY))       
%                 temp_maxX = XX_2;      
%                 temp_maxY = maxf(XX_2);     
%         end
%      end
%     
% end
% % disp(pos)



if mig==0                                   %copepod has been unable to find food, so chooses a random direction to move in      
    cnt=1;
    dir=rand*2*pi;              
    while mig==0&cnt<=8                     
        npos(1)=pos(1)+spd*cos(dir);        %new x co-ordinate
        npos(2)=pos(2)+spd*sin(dir);        %new y co-ordinate
        if npos(1)<ENV_DATA.bm_size&npos(2)<ENV_DATA.bm_size&npos(1)>=1&npos(2)>=1   %check that fox has not left edge of model - correct if so.
           mig=1;
        end
        cnt=cnt+1;
        dir=dir+(pi/4);         %if migration not successful, then increment direction by 45 degrees and try again
    end
end

if mig==1                    %如果mig==1  说明符合条件
    agt.pos=npos;                                   %update agent memory
    IT_STATS.mig(N_IT+1)=IT_STATS.mig(N_IT+1)+1;    %update model statistics
end
