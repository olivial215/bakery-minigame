class Mixer {
  int x, y;
  Inventory inventory;
  PImage mixer, fullMix, partialMix;
  
  Mixer(int x, int y, Inventory inventory) {
    this.x = x;
    this.y = y;
    this.inventory = inventory;
    mixer = loadImage("mixer.png");
    fullMix = loadImage("full.png");
    partialMix = loadImage("partial.png");
  }
  
  
  boolean inRange() {
    return (baker.x > x-10 && baker.x < x + 30 
        && baker.y > y + 20 && baker.y < y + 50
        && baker.bakerSprite == baker.bakerUp);
  }
  /*
  Handle mix key press
  */
  void mix() {
    if (keyPressed && key == 'e' && inRange()) {
      handleMix();
    }
  }
  
  void handleMix() {
    if (inventory.items.size() != 4 && inventory.items.size() > 0) {
      inventory.clearItems();
      inventory.addItem(partialMix);
    }
    
    if (inventory.items.size() == 0) {
      //"You don't have anything to mix!"
    } else {
      inventory.clearItems();
      inventory.addItem(fullMix);
    } 
  }
  
  void render() {
    mix();
    image(mixer, x, y);
  }
}
