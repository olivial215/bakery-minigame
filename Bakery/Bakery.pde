
Baker baker;
StartScreen startScreen;
CountdownTimer timer;
Inventory inv;

boolean gameStart;
boolean gameEnd;

void setup() {
  
  size(400, 300);
  background(255);
  
  gameStart = false;
  gameEnd = false;
  baker = new Baker(width/2, height/2);
  startScreen = new StartScreen();
  timer = new CountdownTimer();
  inv = new Inventory();
}


void draw() {
  background(255);
  
  startScreen.render();
  
  if (gameStart) {
    timer.render();
  }

}
