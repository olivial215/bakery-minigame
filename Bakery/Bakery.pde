Baker baker;
StartScreen startScreen;
EndScreen endScreen;
CountdownTimer timer;
Inventory inventory;
Oven oven;
Fridge milkFridge, eggFridge;
PImage floor;

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
  inventory = new Inventory();
  oven = new Oven();
  milkFridge = new Fridge (235, 70, "milk");
  eggFridge = new Fridge (300, 70, "egg");
  floor = loadImage("floor.png");
}


void draw() {
  background(#eadcca);
  
  image(floor, 0, 115);
  milkFridge.render();
  eggFridge.render();
  
  if (baker.y < oven.y + 10) {
    baker.render();
    oven.render();
  } else {
    oven.render();
    baker.render();
  }
  
  baker.move();
  inventory.render();
  
  
  if (gameStart) {
    timer.render();
  }
  
  startScreen.render();
  endScreen.render();

}
