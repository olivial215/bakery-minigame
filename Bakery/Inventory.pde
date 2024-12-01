class Inventory {
  int x, y;
  PImage slot;
  ArrayList<PImage> items;
  
  Inventory() {
    this.x = 10;
    this.y = 10;
    this.slot = loadImage("slot.png");
    this.items = new ArrayList();
  }
  
  void render() {
    for(int i=0; i<4; i++) {
      image(slot, x + i * 40, y);
    }
  }
  
  //draw given item in inventory 
  void addItem(PImage item) {
    imageMode(CENTER);
    int spaceBetween = slot.width + slot.width - 40;
    
    //only add if item isn't already in the inventory 
    if (items.contains(item) == false) {
      items.add(item);
      //which slot: based on size of items array 
      image(item, x + slot.width/2 + (spaceBetween * items.size()), y);
    }
  }
  
  
  
}
