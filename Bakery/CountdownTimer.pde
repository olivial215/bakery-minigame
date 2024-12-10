class CountdownTimer {
  int timeCounter = 90;
  CountdownTimer() {}
  
  /*
  decrease time remaining every second 
  (every 60 frames) until it reaches 0
  */
  void updateTimeRemaining() {
     if(frameCount % 60 == 0) {
       if(timeCounter > 0) {
         timeCounter--;      
       } else {
         gameEnd = true;
         endScreen.win = false;
       }
     }
  }
  
  //render time in top right corner 
  void render() {
    textFont(pixel2);
    this.updateTimeRemaining();
    fill(#000000);
    textAlign(RIGHT);
    text("TIME", width - 15, 25);
    text(timeCounter, width - 15, 40);
  }
}
