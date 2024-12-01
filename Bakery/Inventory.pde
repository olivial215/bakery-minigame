class Inventory {
  int x, y;
  PImage slot;
  
  Inventory() {
    this.x = 50;
    this.y = 50;
    this.slot = loadImage("slot.png");
  }
  
  void render() {
    for(int i=0; i<5; i++) {
      image(slot, 50 + i * 10, 50);
    }
  }
  
}
