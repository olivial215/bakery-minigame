class EndScreen {
  boolean win;
  int startFrame;
  boolean timeStart;
  PImage winImg, loseImg, clock;
  
  EndScreen() {
    win = false;
    timeStart = false;
    winImg = loadImage("winImg.png");
    loseImg = loadImage("loseImg.png");
    clock = loadImage("clock.png");
  }
  
  void bgRender() {  
    textFont(pixel2);
    rectMode(CENTER);
    textAlign(CENTER);
    imageMode(CENTER);
    
     fill(#56331e);
     strokeWeight(15);
     stroke(0);
     rect(width/2, height/2, width, height);
     noStroke();
     fill(#83624f);
     rect(width/2, height/2, width - 30, height - 30);
     
     
    fill(#ffffff);
    strokeWeight(2);
    stroke(0);
    fill(#e6a73c);
    rect(width/2, 225, 175, 30);
  }
  
  void render() {
    bgRender();
    fill(0);   
    
    if (!timeStart) {
      startFrame = frameCount;
      timeStart = true;
    }
    
    if (win) {
      image(winImg, width/2, height/2 - 30);
      text("You made a cake!", width/2, 230);
    } else {
      image(loseImg, width/2, height/2 - 30);
        if (timer.timeCounter == 0) {
          rect(width/2, height/2, 100, 80);
          image(clock, width/2, height/2, 100, 100);
          text("You ran out of time!", width/2, 230);
        } else {
          text("You didn't make a cake...", width/2, 230);
        } 
    }
    
    if (frameCount - startFrame > 5 * frameRate) {
      exit();
    }
    
  }
}
