class Oven {
  PImage ovenIMG;
  int x,y;
  
  Oven() {
    ovenIMG = loadImage("oven.png");
    this.x = 100;
    this.y = height/2;
  }
  
  void render() {
    image(ovenIMG, x, y, 50, 50);
    
    if (baker.x > x && baker.x < x + 50
         && baker.y > y + 20 && baker.y < y + 50
         && baker.bakerSprite == baker.bakerUp) {
           textAlign(LEFT);
      text("Press 'E' to bake", baker.x + 30, baker.y + 20);
      
      if (keyPressed && key == 'e') {
        gameEnd = true;
      }
    }
  }
  
  // constrain baker from walking over oven:
  
  
}
