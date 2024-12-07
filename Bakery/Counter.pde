class Counter {
  int x,y;
  PImage counter;
  
  Counter(int x, int y, PImage counter) {
    this.x = x;
    this.y = y;
    this.counter = counter;
  }
  
  /*
  boolean inBoundary(Baker baker) {
    return baker.x + baker.spriteWidth > x && baker.x < x + width && 
           baker.y + baker.spriteHeight > y && baker.y < y + height;
  }
  */
  
  
  //renders the counter
  void render() {
    image(counter, x, y);
  }
}
