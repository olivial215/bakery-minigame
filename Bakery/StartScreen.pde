class StartScreen {
  PImage title;
  int spacing;
  int x,y;
  
  StartScreen() {
    title = loadImage("title.png");
    spacing = 18;
    x = 50;
    y = 120;
  }
    
  void background() {
     rectMode(CENTER);
     fill(#56331e);
     strokeWeight(15);
     stroke(0);
     rect(width/2, height/2, width, height);
     noStroke();
     fill(#83624f);
     rect(width/2, height/2, width - 30, height - 30);
     strokeWeight(2);
     stroke(0);
     fill(#e6a73c);
     rect(width/2, 245, 175, 30);
     
  }
  void render() {
    if (gameStart == false) {
      background();
      image(title, 0, 0);
      textAlign(LEFT);
      textFont(pixel2);
      fill(0);
      text("Objective: Bake a cake!", x, 110);
      text("1. Press arrow keys to move", x, y + spacing);
      text("2. Press 'c' to collect an item", x, y + 2*spacing);
      text("3. Press 'e' to interact with appliances", x, y + 3*spacing);
      text("4. Find and collect all ingredients", x, y + 4*spacing);
      text("5. Mix ingredients, then bake", x, y + 5*spacing);

      textAlign(CENTER);
      text("Press 'space' to start", width/2, 250);
    }
    
    if (keyPressed && key == ' ') {
      gameStart = true;
    }
    
  }
}
