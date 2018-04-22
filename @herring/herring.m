classdef herring          %declares herring object
    properties         %define herring properties (parameters) 
        age; 
        food;
        pos;
        speed;
        last_breed;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
                                    %all additional member functions associated with this class are included as separate mfiles in the @herring folder. 
            function h=herring(varargin) %constructor method for herring  - assigns values to herring properties
                %h=herring(age,food,pos....)
                %
                %age of agent (usually 0)
                %food - amount of food that herring has eaten
                %pos - vector containg x,y, co-ords 

                %Modified by Martin Bayley on 29/01/13

            switch nargin                     %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0                        %create default object
                    h.age=[];			
                    h.food=[];
                    h.pos=[];
                    h.speed=[];
                    h.last_breed=[];
                case 1                         %input is already a herring, so just return!
                    if (isa(varargin{1},'herring'))		
                        h=varargin{1};
                    else
                        error('Input argument is not a herring')
                    end
                case 5                          %create a new herring (currently the only constructor method used)
                    h.age=varargin{1};               %age of herring object in number of iterations
                    h.food=varargin{2};              %current food content (arbitrary units)
                    h.pos=varargin{3};               %current position in Cartesian co-ords [x y]
                    h.speed=varargin{4};             %number of kilometres herring can migrate in 1 day
                    h.last_breed=varargin{5};        %number of iterations since herring last reproduced.
                otherwise
                    error('Invalid no. of input arguments for herring')
            end
        end
    end
end