LetterBoard letterBoard;
String currentWord = "";
int lastFrame = 0;
int frame = 0;

void setup() {
  size(500,500);
  letterBoard = new LetterBoard(100,100);
  setupSound();

}
 
void draw() {
  background(255);
  updateSound();
  
  letterBoard.drawBoard();
  if(getAmp()>0.1) {
    if(letterBoard.state==0 && frame-lastFrame>20){
      letterBoard.nextState();
      lastFrame = frame;
    }else if(letterBoard.state==1 && frame-lastFrame>20) {
      char c = letterBoard.getLetter();
      currentWord+=c;
      letterBoard.nextState();
      lastFrame = frame;
    }
  }
  textSize(30);
  fill(0);
  text("Your Input: " + currentWord, 100,450); 
  frame++;
}
