class EndScreen {
  PImage winScreen, loseScreen;
  boolean win;
  
  EndScreen() {
    win = false;
  }
  
  void render() {
    textFont(pixel);
    rectMode(CENTER);
    fill(0);
     
    if(gameEnd) {
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
    }
  }
}
