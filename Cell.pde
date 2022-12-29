class Cell{
  int x;
  int y;
  
  Cell(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void show(){
    noFill();
    stroke(0);
    rect(this.x, this.y, len, len);
  }
  
  boolean occupied(){
    for(Agent a : agents){
      if(a.x == this.x && a.y == this.y){
        return true;
      }
    }
    return false;
  }
  
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
