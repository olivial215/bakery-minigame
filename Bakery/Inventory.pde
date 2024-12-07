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
  
  /*
  Clears inventory items 
  */
  void clearItems() {
    items.clear();
  }
  
  boolean contains(PImage item) {
    return items.contains(item);
  }
  
  
  /**
  does the mix have all ingredients?
  **/
  boolean hasAll() {
    return mix.contains(flourInvIMG) &&
    mix.contains(sugarInvIMG) &&
    mix.contains(eggFridge.egg) &&
    mix.contains(milkFridge.milk);
  }
  
  /*
  Render the inventory by drawing its slots and items
  */
  void render() {
    drawSlots();
    drawItems();
  }
  
}
