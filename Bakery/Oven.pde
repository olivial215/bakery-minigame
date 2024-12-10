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
  
  //is the player facing and in range of the oven>
  boolean inRange() {
    return (baker.x > x - 20 && baker.x < x + ovenIMG.width
         && baker.y > y && baker.y < y + ovenIMG.height
         && baker.bakerSprite == baker.bakerUp);
  }
  
  //handles key press when in range of oven
  //oven can only be used if player has a mixture.
  void handleBake() {
    if (keyPressed && key == 'e' && inRange()) {
      if(inventory.contains(mixer.fullMix)) {
        gameEnd = true;
        endScreen.win = true;
      } else if (inventory.contains(mixer.partialMix)) {
        gameEnd = true;
      } 
    }
  }
    
  //renders the oven image
  void render() {
    handleBake();
    image(ovenIMG, x, y);
  }
  
  //renders the instruction message when in range
  void renderMsg() {
    if(this.inRange() && inventory.hasMix()) {
      Message message = new Message("press 'e' to bake");
      message.render();
    }
  }
}
