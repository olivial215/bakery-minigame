Baker baker;
StartScreen startScreen;
EndScreen endScreen;
CountdownTimer timer;
Inventory inv;
Oven oven;

boolean gameStart;
boolean gameEnd;

void setup() {
  
  size(400, 300);
  background(255);
  
  gameStart = false;
  gameEnd = false;
  baker = new Baker(width/2, height/2);
  startScreen = new StartScreen();
  endScreen = new EndScreen();
  timer = new CountdownTimer();
  inv = new Inventory();
  oven = new Oven();
}


void draw() {
  background(#a87d59);
  
  startScreen.render();
  
  if (gameStart) {
    timer.render();
  }
  
  endScreen.render();

}
