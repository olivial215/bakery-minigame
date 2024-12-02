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


// add an if statement to control the order of the objects being drawn 

void draw() {
  background(#eadcca);
  
  oven.render();
  baker.render();
  baker.move();
  inv.render();
  
  if (gameStart) {
    timer.render();
  }
  
  startScreen.render();
  endScreen.render();
  


}
