classdef copepod   %declares copepod object
    properties    %define copepod properties (parameters) 
        age; 
        food;
        pos;
        speed;
        last_breed;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
                                    %all additional member functions associated with this class are included as separate mfiles in the @copepod folder. 
        function c=copepod(varargin) %constructor method for copepod - assigns values to copepod properties
                %c=copepod(age,food,pos....)
                %
                %age of agent (usually 0)
                %food - amount of food that copepod has eaten
                %pos - vector containg x,y, co-ords 

                %Modified by Martin Bayley on 29/01/13


                switch nargin           %Use switch statement with nargin,varargin contructs to overload constructor methods
                    case 0				%create default object
                       c.age=[];			
                       c.food=[];
                       c.pos=[];
                       c.speed=[];
                       c.last_breed=[];
                    case 1              %input is already a copepod, so just return!
                       if (isa(varargin{1},'copepod'))		
                            c=varargin{1};
                       else
                            error('Input argument is not a copepod')
                            
                       end
                    case 5               %create a new copepod (currently the only constructor method used)
                       c.age=varargin{1};               %age of copepod object in number of iterations
                       c.food=varargin{2};              %current food content (arbitrary units)
                       c.pos=varargin{3};               %current position in Cartesian co-ords [x y]
                       c.speed=varargin{4};             %number of kilometres copepod can migrate in 1 day
                       c.last_breed=varargin{5};        %number of iterations since copepod last reproduced.
                    otherwise
                       error('Invalid no. of input arguments')
                end
        end
    end
end
