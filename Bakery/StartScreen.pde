class StartScreen {
  StartScreen() {}
    
  void render() {
    
    if (gameStart == false) {
      rectMode(CENTER);
      fill(0);
      rect(width/2, height/2, width, height);
      fill(#ffffff);
      textAlign(CENTER);
      text("Press arrow keys to move", 200, 100);
      text("Press space to start playing", 200, 200);
    }
    else {
      background(255);
      baker.render();
      baker.move();
      inv.render();
    }
    
    if (keyPressed && key == ' ') {
      gameStart = true;
    }
    
  }
}
