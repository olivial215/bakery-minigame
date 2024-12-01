class CountdownTimer {
  int timeCounter = 330;
  CountdownTimer() {}
  
  void updateTimeRemaining() {
     if(frameCount % 60 == 0) {
       if(timeCounter > 0) {
         timeCounter--;      
       }
     }
  }
  
  void render() {
    this.updateTimeRemaining();
    fill(#000000);
    textAlign(RIGHT);
    text("TIME", width - 20, 40);
    text(timeCounter, width - 20, 60);
  }
}
