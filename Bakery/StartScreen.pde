class StartScreen {
  StartScreen() {}
    
  void render() {
    
    if (gameStart == false) {
      rectMode(CENTER);
      fill(0);
      rect(width/2, height/2, width, height);
      fill(#ffffff);
      textAlign(LEFT);
      text("1. Press arrow keys to move", 75, 75);
      text("2. Press 'E' to collect an item", 75, 100);
      text("3. Find and collect all ingredients", 75, 125);
      text("4. TO WIN: Press 'E' near the oven to bake!", 75, 150);
      
      textAlign(CENTER);
      text("Press 'space' to start playing", 200, 250);
    }
    
    if (keyPressed && key == ' ') {
      gameStart = true;
    }
    
  }
}
