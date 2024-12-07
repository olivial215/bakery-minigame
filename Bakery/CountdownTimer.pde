class CountdownTimer {
  int timeCounter = 300;
  CountdownTimer() {}
  
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
  
  void render() {
    this.updateTimeRemaining();
    fill(#000000);
    textAlign(RIGHT);
    text("TIME", width - 15, 25);
    text(timeCounter, width - 15, 40);
  }
}
