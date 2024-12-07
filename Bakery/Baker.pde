class Baker {
  int x;
  int y;
  PImage bakerLeft, bakerRight, bakerUp, bakerDown;
  int spriteWidth = 32;
  int spriteHeight = 40;
  PImage bakerSprite;
  int sliceX;
  int movingFrameCount;
  
  Baker(int x, int y) {
    this.x = x;
    this.y = y;
    this.bakerLeft = loadImage("left.png");
    this.bakerRight = loadImage("right.png");
    this.bakerUp = loadImage("up.png");
    this.bakerDown= loadImage("down.png");
    this.bakerSprite = bakerLeft; 
    this.sliceX = 0;
    this.movingFrameCount = 0;
  }
  
  //move baker within boundaries
  void move() {
    if (keyPressed == true) {
      
      if (key == CODED) {
        
        if(keyCode == LEFT) {
          x -= 2;
          bakerSprite = bakerLeft;
        } else if (keyCode == RIGHT) {
          x += 2;
          bakerSprite = bakerRight;
        } else if (keyCode == UP) {
          y -= 2;
          bakerSprite = bakerUp;
        } else if (keyCode == DOWN) {
          y += 2;
          bakerSprite = bakerDown;
        }
      }
    }
   boundary();
    
  }
  
  void boundary() {
    //right boundary 
    if (x + spriteWidth > width) {
      x = width - spriteWidth;
    }
    //left boundary
    if (x < 0) {
      x = 0;
    }
    //top boundary
    if (y < 100) {
      y = 100;
    }
    //bottom boundary 
    if (y + spriteHeight > height) {
      y = height - spriteHeight;
    }
    
    
  }
  
  //sprite animation
  void updateSliceX() {
    
    if(keyPressed == true && key == CODED && (keyCode == LEFT || keyCode == RIGHT || 
    keyCode == UP || keyCode == DOWN)) {
      movingFrameCount += 1;
      
      if (movingFrameCount % 10 == 0) {
        if(sliceX == spriteWidth * 3) {
          sliceX = 0;
        } else {
          sliceX += spriteWidth;
        }
      }
    } else {
      sliceX = 0;
    }
  }
  
  //draw baker
  void render() {
    updateSliceX();
    copy(bakerSprite, sliceX, 0, spriteWidth, spriteHeight, x, y, spriteWidth, spriteHeight);
  }
}
