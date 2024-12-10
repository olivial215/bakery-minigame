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
  
  
  //is the player facing and in range of the mixer?
  // -> player can only access it when in front of the counter,
  // not behind 
  boolean inRange() {
    return (baker.x > x-10 && baker.x < x + 30 
        && baker.y > y + 20 && baker.y < y + 50
        && baker.bakerSprite == baker.bakerUp);
  }
  
  //Handles key press when in range of mixer
  void mix() {
    if (keyPressed && key == 'e' && inRange()) {
      handleMix();
    }
  }
  
  //handles what is added to inv based on inv contents
  void handleMix() {
    if (inventory.hasAll()) {
      inventory.clearItems();
      inventory.addItem(fullMix);
    } else if (inventory.mix.size() == 0) {
      //You don't have anything to mix! do nothing 
    } else {
      inventory.clearItems();
      inventory.addItem(partialMix);
    }
  }
  
  
  //render mixer image
  void render() {
    mix();
    image(mixer, x, y);
  }
  
    
  //render instructions message when in range
  void renderMsg() {
    if(this.inRange() && inventory.hasIngredient()) {
      Message message = new Message("press 'e' to mix");
      message.render();
    }
  }
}
