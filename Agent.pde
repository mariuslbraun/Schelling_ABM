
class Agent{
  int x; // agent's x position
  int y; // agent's y position
  boolean red = false; // agent type
  
  Agent(int x, int y){
    // assign position
    this.x = x;
    this.y = y;
    
    // randomly assign agent type (red or blue)
    int r = round(random(1));
    if(r == 1){
      red = true;
    }
  }
  
  // show agents as red or blue rectangles
  void show(){
    noStroke();
    if(red){
      fill(255, 0, 0); 
    } else{
      fill(0, 0, 255);
    }
    rect(this.x, this.y, len, len);
  }
  
  // check whether current grid cell is already occupied by another agent
  void singleGrid(Agent other){
    int cols = (width / len) - 1;
    int rows = (height / len) - 1;
    if(!other.equals(this)){
      while(other.x == this.x && other.y == this.y){
      // move agent to another random cell if current cell is already occupied
      int newx = (round(random(1, cols - 2))) * len;
      int newy = (round(random(1, rows - 2))) * len;
      this.x = newx;
      this.y = newy;
      }
    }  
  }
  
  // calculate share of neighbors that are of the agent's own as well as the other type
  float checkNeighbors(){
    float numRed = 0;
    float numBlue = 0;
    
    int col = int(this.x / len);
    int row = int(this.y / len);
    for(int i = -1; i <= 1; i++){
      for(int j = -1; j <= 1; j++){
      if(grid[col + i][row + j].isRed() != -1){
        if(grid[col + i][row + j].isRed() == 1){
        numRed++;
        } else{
         numBlue++;
        }
      }
     }
    }
    
    if(this.red == true){
      return numBlue / (numBlue + numRed);
    } else{
      return numRed / (numBlue + numRed);
    }
  }
  
  // move agent to nearest available empty cell if tolerance level is surpassed
  void step(){
    if(checkNeighbors() > tolerance){
      float minDist = 10000000;
      int newx = 0;
      int newy = 0;
      for (int i = 1; i < grid.length - 1; i++) {
        for (int j = 1; j < grid[i].length - 1; j++) {
          if(grid[i][j].occupied()){
            continue;
          } else{
            float d = abs(dist(this.x, this.y, grid[i][j].x, grid[i][j].y));
            if(d < minDist){
              minDist = d;
              newx = grid[i][j].x;
              newy = grid[i][j].y;
            }
          }
        }
      }
      
      this.x = newx;
      this.y = newy;
    }
  }
}
  
