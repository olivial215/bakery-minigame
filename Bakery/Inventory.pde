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
    //which slot: based on size of items array 
    if (items.contains(item) == false) {
      items.add(item);
      image(item, x, y);
    }
  }
  
  
  
}
