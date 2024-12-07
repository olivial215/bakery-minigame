class EndScreen {
  PImage winScreen, loseScreen;
  boolean win;
  int startFrame;
  boolean timeStart;
  
  EndScreen() {
    win = false;
    timeStart = false;
    
  }
  
  void render() {
    textFont(pixel2);
    rectMode(CENTER);
    fill(0);
    
    if (!timeStart) {
      startFrame = frameCount;
      timeStart = true;
    }
    
    if (win) {
      rect(width/2, height/2, width, height);
      fill(#ffffff);
      textAlign(CENTER);
      text("You win!", width/2, height/2);
    } else {
      rect(width/2, height/2, width, height);
      fill(#ffffff);
      textAlign(CENTER);
      text("You lose!", width/2, height/2);
    }
    
   if (frameCount - startFrame > 5 * frameRate) {
      exit();
    }
    
  }
}
