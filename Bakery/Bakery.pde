PFont pixel, pixel2;

StartScreen startScreen;
EndScreen endScreen;
CountdownTimer timer;

Baker baker;
Inventory inventory;
Oven oven;
Fridge milkFridge, eggFridge;
Mixer mixer;
Ingredient flour, sugar;
Counter topCounter, midCounter, botCounter, sideCounter;


PImage floor, counter1, counter2, counter3, counter4;
PImage flourInvIMG, flourGameIMG, sugarInvIMG, sugarGameIMG; 

boolean gameStart, gameEnd;

void setup() {
  size(400, 300);
  background(255);
  pixel = createFont("m5x7.ttf", 16);
  pixel2 = createFont("m5x7.ttf", 20);
  
  gameStart = false;
  gameEnd = false;
  startScreen = new StartScreen();
  endScreen = new EndScreen();
  timer = new CountdownTimer();
  
  baker = new Baker(50, height/2);
  inventory = new Inventory();
  oven = new Oven(110, 87, inventory);
  milkFridge = new Fridge(235, 70, "milk");
  eggFridge = new Fridge(300, 70, "egg");
  mixer = new Mixer(160, 160, inventory);
  floor = loadImage("floor.png");
  
  flourInvIMG = loadImage("flour.png");
  flourGameIMG = loadImage("tableFlour.png");
  sugarInvIMG = loadImage("sugar.png");
  sugarGameIMG = loadImage("tableSugar.png");
  
  flour = new Ingredient(27, 244, flourInvIMG, flourGameIMG);
  sugar = new Ingredient(150, 254, sugarInvIMG, sugarGameIMG);
  
  counter1 = loadImage("counter1.png");
  counter2 = loadImage("counter2.png");
  counter3 = loadImage("counter3.png");
  counter4 = loadImage("counter4.png");
  
  topCounter = new Counter(23, 89, counter1);
  midCounter = new Counter(115,170, counter2);
  botCounter = new Counter(0, 260, counter3);
  sideCounter = new Counter(318, 148, counter4);
}


void draw() {
  background(#eadcca);
  
  image(floor, 0, 115);
  milkFridge.render();
  eggFridge.render();
  oven.render();
  topCounter.render();
  
  if (baker.y < midCounter.y) {
    baker.render();
    midCounter.render();
    mixer.render();
  } else {
    midCounter.render();
    mixer.render();
    baker.render();
  }
  
  baker.move();
  inventory.render();
  sideCounter.render();
  botCounter.render();
  flour.render();
  sugar.render();

  //render messages
  flour.renderMsg();
  sugar.renderMsg();
  eggFridge.renderMsg();
  milkFridge.renderMsg();
  mixer.renderMsg();
  oven.renderMsg();
  
  /*
  if (flour.inRange() || sugar.inRange()) {
    Message message = new Message("press 'c' to collect");
    message.render();
  }
  */
  
  if (gameStart) {
    timer.render();
  }
  
  startScreen.render();
  
  if (gameEnd) {
    endScreen.render();
  }

}
