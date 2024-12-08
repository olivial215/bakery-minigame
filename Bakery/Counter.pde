class Counter {
  int x,y;
  PImage counter;
  
  Counter(int x, int y, PImage counter) {
    this.x = x;
    this.y = y;
    this.counter = counter;
  }

  //renders the counter
  void render() {
    image(counter, x, y);
  }
}
