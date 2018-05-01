# com6009modeling

Deadlines
Plan:  17th April - 6 days
Final: 14th May 3pm - 33 days

Task list:
Part A and B happen in parallel
	
0. Part 0: (Plan) [Due 17th April]
   - read 4? papers
   - choose a system to model - [3rd April]
     - Generate ideas
       - Sharks vs Schools of Fish - does flocking increase survival rate?
       - Hallibut hunting jellyfish
       - Dolphin hunting (maybe as an extension of sharks)
     - Figure out Pros and Cons
     - Choose as a group - SHARKS VS FISH!
     - Find academic papers on chosen topic - Pierre
       1. SCHOOLING BEHAVIOR IN THE GUPPY (POECILIA RETICULATA): AN EVOLUTIONARY RESPONSE TO PREDATION https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1558-5646.1974.tb00774.x
       2. A comparison of shark and wolf research reveals similar behavioral responses by prey https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/090226
       3. Flocking for multi-agent dynamic systems: algorithms and theory https://ieeexplore.ieee.org/abstract/document/1605401/
       4. Flocking Behaviour https://pdfs.semanticscholar.org/c4a1/25fe7af0e42f85a6d98df3b7a192c42d3428.pdf
     - Each read 1 academic paper
     - Maybe the fish could be atlantic herring, since they display flocking hunting behaviour, but also are hunted. 
   - which entities are agents?
     - Things with position
       - Things which don't move
         - Food? (Maybe this could be food for the fish (e.g. Jellyfish)
         - Obstacles?
       - Things which move (agents? Or we could have moving food?)
         - Sharks
         - Fish (maybe herring?)
         - (if we choose herring) Copepods
   - what states for the agents?
     - Sharks
       - Searching for food?
       - Smell
       - Sight
       - Scalloped hammerheads apparently school/flock?
       - 'Cruising' movement
       - Active hunting
       - 'Burst' movement
     - Fish
       - Searching for food?
       - Avoiding danger
       - Aligning with other fish
       - Keeping distance from other fish
       - Attracting to other fish
   - what type of behaviour?
     - Sharks
       - Hunting patterns?
     - Fish
       - Flocking as a means of increasing survival rate?
       - (if we choose herring) Flocking as a means of catching more prey
   - how to represent environment?
     - areas of high food? - varies dynamically
     - areas of preferred temperature? - doesn't vary
   - time and length scales
     - 1s timestep?
     - 100cm grid size?
     - Atlantic Herring cruise at 108cm/s
   - emergent behaviour generated?
     - Increased survival from predators
     - Increased hunting effectiveness

1. Part A: (Writing the model) [Due 14th May] 6th May
   - Develop
     - Tasks to do:
	   - Fix steering bug (Pierre)
	   - Herring (Predator) Cohesion (Pierre)
	   - Herring (Predator) Separation (Pierre)
	   - Herring (Predator) Alignment (Pierre)
	   - Hurring (Predator) Hunting (Pierre)
	   - Copepod (Prey) avoid behaviour (Yang)
	   - Copepod (Prey) random move behaviour (Yang) 
	   - Draw arrow vectors for copepods (Cheng) 3rd May
	   - Implement accurate numbers (Anna + Pierre)
	   - Change environment
   - Test
     - Are there bugs?
	 - Are herring flocking?
	   - Qualitative assessment
	 - Are copepods escaping?
	   - Qualitative assessment
   - Experiment 4th May
     - Design experiments
	   - Environment Size
	   - Write 1 page of experiment design (Anna)
	     - Preparation
		 - Procedure
		 - Expectation
	 - Run experiments
	 - Collect results
   - Analysis
	 - Implement graphs/statistics (Yang + Cheng)
   - Optimise
     - If we have time (we don't)

2. Part B: (Literature Review) [Due 14th May]
   - Overview of ABMs
   - Detailed review of one
		
3. Part C? (Full Report) [Total < 8 pages] [Due 14th May] 11th May
   - Abstract [200 words]
   - Intro and Background [2 pages - basically the Lit Review]
   - Modelling Methodology [1-2 pages]
     - Explain our code
	 - Adapt diagram
   - Results
     - Model Predictions [~2 pages]
     - Computational efficiency [< 1 page]
   - Discussion and conclusions [~1 page]
   - Conclusion [< 0.5 page]
   - Bibliography [Not included in page count]
   - Appendix [Not included in page count]
   
Useful links:

Java implementation 
https://processing.org/examples/flocking.html

Swarm Robot OS
https://drive.google.com/open?id=1rOqNr6566xUlqXQqhWtWpeJPmUrEmNkI

Boids 

Background and Update 
http://www.red3d.com/cwr/boids/

flocking code example: use 
https://uk.mathworks.com/matlabcentral/fileexchange/32022-swarmfish-the-artificial-fish-swarm-algorithm
