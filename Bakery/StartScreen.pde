class StartScreen {
  boolean render = true;
  StartScreen() {}
    
  void render() {
    
    if (render) {
      rectMode(CENTER);
      fill(0);
      rect(width/2, height/2, width, height);
      fill(#ffffff);
      text("Goal: Get to the Flower!", 350, 200);
      text("Press any key to start playing.", 350, 400);
    }
    else {
      background(255);
      baker.render();
      baker.move();
    }
    
    if (keyPressed && key == ' ') {
      render = false;
      gameStart = true;
    }
    
  }
}
