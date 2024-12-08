class Ingredient {
  int x, y;
  boolean collected;
  PImage invIMG, gameIMG; //inventory image and game image 
  
  Ingredient(int x, int y, PImage invIMG, PImage gameIMG) {
    this.x = x;
    this.y = y;
    this.invIMG = invIMG;
    this.gameIMG = gameIMG;
    collected = false;
  } 
  
  void collectItem() {
    if (!collected && inRange()) {
      //text("Press 'C' to collect");
      if (keyPressed && key == 'c') {
        inventory.addItem(invIMG);
        collected = true;
      }
    }
  }
  
  boolean inRange() {
  return (baker.x > x && baker.x < x + gameIMG.width
    && baker.y > y - 50 
    && baker.bakerSprite == baker.bakerDown);
  }
  
  
  void render() {
    collectItem();
    if (!collected) {
      image(gameIMG, x, y);
    }
  }
  
  void renderMsg() {
    if(this.inRange() && !collected) {
      Message message = new Message("press 'c' to collect");
      message.render();
    }
  }
}
