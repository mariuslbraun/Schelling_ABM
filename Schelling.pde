/* This code implements the Schelling (1969) agent-based model of segregation.
There are two types of agents (red and blue), which are initially placed randomly
on a grid of cells. Agents have a tolerance level regarding the share of their
neighbors that are of the respective other type. If this share increases beyond
the tolerance level, agents relocate to the nearest empty cell. As a result, agents
sort themselves into areas only containing either red or blue agents.

Marius Braun, December 2022*/

int len = 40; // width and height of cells
Cell[][] grid;
ArrayList<Agent> agents = new ArrayList<Agent>();
int n = 250; // number of agents
float tolerance = 0.3; // tolerance level

void setup() {
  size(800, 800); // create canvas
  
  // initialize grid
  int cols = (width / len);
  int rows = (height / len);
  grid = new Cell[cols][rows];

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      int x = i * len;
      int y = j * len;
      grid[i][j] = new Cell(x, y);
    }
  }
  
  // place agents on the grid
  for(int i = 0; i < n; i++){
    int x = round(random(1, cols - 2)) * len;
    int y = round(random(1, rows - 2)) * len;
    agents.add(new Agent(x, y));
  }
    
   frameRate(20);
}

void draw() {
  background(255);
  for(Agent a : agents){
    for(Agent other : agents){
      a.singleGrid(other); // check that each cell is only occupied by one agent
    }
    a.show(); // display agents
    a.checkNeighbors(); // check how many neighborhood are of the respective other type
  }
  
  // move agents to nearest empty cells
  for(Agent a : agents){
    a.step();
  }
  
  // draw grid
  for (int i = 1; i < grid.length - 1; i++) {
    for (int j = 1; j < grid[i].length - 1; j++) {
      grid[i][j].show();
    }
  }
}
