class Cell{
  int x; // cell's x position
  int y; // cell's y position
  
  Cell(int x, int y){
    // assign position
    this.x = x;
    this.y = y;
  }
  
  // draw cell as black rectangle
  void show(){
    noFill();
    stroke(0);
    rect(this.x, this.y, len, len);
  }
  
  // check if cell is occupied by any agent
  boolean occupied(){
    for(Agent a : agents){
      if(a.x == this.x && a.y == this.y){
        return true;
      }
    }
    return false;
  }
  
  // get type of the agent occupying the cell
  int isRed(){
    for(Agent a : agents){
      if(a.x == this.x && a.y == this.y){
        if(a.red){
          return 1;
        } else{
          return 0;
        }
      }
    }
    return -1;
  }
}
