
Baker baker;
StartScreen startScreen;
CountdownTimer timer;

boolean gameStart;
void setup() {
  
  size(400, 300);
  background(255);
  
  gameStart = false;
  baker = new Baker(width/2, height/2);
  startScreen = new StartScreen();
  timer = new CountdownTimer();
}


void draw() {
  background(255);
  
  startScreen.render();
  
  if (gameStart) {
    timer.render();
  }

}
