class EndScreen {
  
  EndScreen() {}
  
  void render() {
    if(gameEnd) {
      //win screen (if all items collected)
      rectMode(CENTER);
      fill(0);
      rect(width/2, height/2, width, height);
      
      fill(#ffffff);
      textAlign(CENTER);
      text("You win!", width/2, height/2);
      
      //ran out of time -> lose screen
      
    }
  }
}
