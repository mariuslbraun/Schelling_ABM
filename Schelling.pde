int len = 40;
Cell[][] grid;
ArrayList<Agent> agents = new ArrayList<Agent>();
int n = 250;
float tolerance = 0.3;

void setup() {
  size(800, 800);
  

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
      a.singleGrid(other);
    }
    a.show();
    a.checkNeighbors();
  }
  
  for(Agent a : agents){
    a.step();
  }
  
  for (int i = 1; i < grid.length - 1; i++) {
    for (int j = 1; j < grid[i].length - 1; j++) {
      grid[i][j].show();
    }
  }
}
