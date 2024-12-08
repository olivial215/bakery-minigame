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
    int dx = 0, dy = 0;
    
    if (keyPressed) {
      
      if (key == CODED) {
        
        if(keyCode == LEFT) {
          dx= -2;
          bakerSprite = bakerLeft;
        } else if (keyCode == RIGHT) {
          dx = 2;
          bakerSprite = bakerRight;
        } else if (keyCode == UP) {
          dy = -2;
          bakerSprite = bakerUp;
        } else if (keyCode == DOWN) {
          dy = 2;
          bakerSprite = bakerDown;
        }
      }
    }
   
   if (!isColliding(x + dx, y + dy, midCounter) && !atBoundary(x + dx, y + dy)) {
     x += dx;
     y += dy;
   }

  }
  
  boolean atBoundary(int newX, int newY) {
    return
    //right boundary
    newX + spriteWidth > width - 30 ||
    //left boundary
    newX < 0 || 
    //top boundary
    newY < 100 ||
    //bot boundary
    newY + spriteHeight > height - 25;
  }
  
  boolean isColliding(int newX, int newY, Counter counter) {
    return
    newX > counter.x - 25 && 
    newX < counter.x + counter.counter.width - 5 &&
    newY > counter.y - 25  && 
    newY < counter.y + counter.counter.height - 30;
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
