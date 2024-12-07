class Oven {
  PImage ovenIMG;
  int x,y;
  Inventory inventory;
  
  Oven(int x, int y, Inventory inventory) {
    ovenIMG = loadImage("oven.png");
    this.x = x;
    this.y = y;
    this.inventory = inventory;
  }
  
  boolean inRange() {
    return (baker.x > x - 20 && baker.x < x + ovenIMG.width
         && baker.y > y && baker.y < y + ovenIMG.height
         && baker.bakerSprite == baker.bakerUp);
  }
  
  void handleBake() {
    if (keyPressed && key == 'e' && inRange()) {
      if(inventory.contains(mixer.fullMix)) {
        gameEnd = true;
        endScreen.win = true;
      } else if (inventory.contains(mixer.partialMix)) {
        gameEnd = true;
      } else {
        //if inventory does not contain a mix 
        //show error message
      }
    }
  }
    
  void render() {
    handleBake();
    image(ovenIMG, x, y);
  }
  
  
}
