class LetterBoard {
  int rows = 6;
  int columns = 6;
  int state = 0;
  int x, y;
  int currentRow = 0;
  int currentCol = 0;
  int gap=50;
  int tickDown = 0;
  int interval = 100;
  
  String[] lines = {
    "ABCD12",
    "EFGH34",
    "IJKLMN",
    "OPQRST",
    "UVWXYZ",
    "567890",
  };
  
  LetterBoard(int x, int y) {
    this.x = x;
    this.y = y;
    tickDown = interval;
    state = 0;
    currentRow = 0;
    currentCol = 0; 
  }
  
  void drawBoard() {
    textSize(36);
    for(int r = 0;r<rows; r++) {
      for(int c = 0;c<columns;c++) {
        if(r==currentRow){
          fill(255,0,0);
          if(state==1){
            if(c==currentCol){
              fill(0,0,255);
            }else{
              fill(255,0,0);
            }
          }
        }else{
          fill(0);
        }
        int xx = x + c*gap;
        int yy = y + r*gap;
        String s = lines[r].charAt(c)+"";
        text(s, xx, yy);
      }
    }
    
    tickDown--;
    if(tickDown<0) {
      if(state==0) currentRow = (currentRow+1)%rows; 
      else if(state==1) {
        if(currentCol+1==columns) {
          currentCol = 0;
          state = 0;
        }else{
          currentCol++;
        }
      }
      tickDown = interval;
    }
  }
  
  char getLetter() {
    return lines[currentRow].charAt(currentCol);
  }
  
  void nextState() {
    if(state==0){
      state=1;
      currentCol= 0;
      tickDown = interval;
    }else{
      tickDown = interval;
      state = 0;
      currentRow = 0;
      currentCol = 0; 
    }
  }
  
}
