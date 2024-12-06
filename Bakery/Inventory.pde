class Inventory {
  int x, y;
  int spacing;
  ArrayList<PImage> items;
  PImage slot, milk;
  
  Inventory() {
    this.x = 10;
    this.y = 10;
    this.spacing = 42;
    this.items = new ArrayList();
    
    this.slot = loadImage("slot.png");
    this.milk = loadImage("milk.png");
  }
  
  void render() {
    drawSlots();
    drawItems();
  }
  
  void drawSlots() {
    for(int i=0; i<4; i++) {
      image(slot, x + i * spacing, y);
    }
  }
  
  void drawItems() {
    int slotNum = -1;
    
    //for every image in items, draw in inventory 
    for (PImage item: items) {
      slotNum += 1;
      image(item, x + slotNum * spacing, y);
    }
  }
  
  
  void addItem(PImage item) {
    if (items.contains(item) == false) {
      items.add(item);
    }
  }
  
  void addMilk() {
    addItem(milk);
  }
  
}
