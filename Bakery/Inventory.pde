class Inventory {
  int x, y;
  int spacing;
  ArrayList<PImage> items; //items shown in inventory
  ArrayList<PImage> mix; //items in mix
  PImage slot;
  
  Inventory() {
    this.x = 10;
    this.y = 10;
    this.spacing = 42;
    this.items = new ArrayList();
    this.mix = new ArrayList();
    this.slot = loadImage("slot.png");
  }
  
  /*
  Draws inventory slots using a forloop
  */
  void drawSlots() {
    for(int i=0; i<4; i++) {
      image(slot, x + i * spacing, y);
    }
  }
  
  /*
  Draws items in the item arraylist using a forloop
  */
  void drawItems() {
    int slotNum = -1;

    for (PImage item: items) {
      slotNum += 1;
      image(item, x + slotNum * spacing, y);
    }
  }
  
  /*
  Given an item image, if the image is not already in the 
  items array, add it to the array.
  */
  void addItem(PImage item) {
    if (items.contains(item) == false) {
      items.add(item);
      if (item != mixer.fullMix && item != mixer.partialMix) {
        mix.add(item);
      }
    }
  }
  
  //Clears inventory items 
  void clearItems() {
    items.clear();
  }
  
  //does the inv contain the given item?
  boolean contains(PImage item) {
    return items.contains(item);
  }
  
  //does the player have a mixture?
  //this is used to allow the player to bake
  boolean hasMix() {
    return contains(mixer.fullMix) ||
    contains(mixer.partialMix);
  }
  
  //does the player have an ingredient?
  //this is used to allow the player to use the mixer
  boolean hasIngredient() {
    return contains(eggFridge.egg) ||
    contains(milkFridge.milk) ||
    contains(flour.invIMG) ||
    contains(sugar.invIMG);
  }
  
  
  // did the player collect all the ingredients?
  boolean hasAll() {
    return mix.contains(flourInvIMG) &&
    mix.contains(sugarInvIMG) &&
    mix.contains(eggFridge.egg) &&
    mix.contains(milkFridge.milk);
  }
  

  //Renders the inventory by drawing its slots and items
  void render() {
    drawSlots();
    drawItems();
  }
  
}
