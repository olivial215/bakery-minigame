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
  
  /*
  If the ingredient is not collected yet and the player 
  is in range of the ingredient, add ingredient to the inventory 
  and mark as collected.
  plays sound effect when collected 
  */
  void collectItem() {
    if (!collected && inRange()) {
      if (keyPressed && key == 'c') {
        inventory.addItem(invIMG);
        collected = true;
        collect.play();
      }
    }
  }
  
  //is the player facing and in range of the ingredient?
  boolean inRange() {
  return (baker.x > x- 5 && baker.x < x + gameIMG.width
    && baker.y > y - 50 
    && baker.bakerSprite == baker.bakerDown);
  }
  
  
  //renders the ingredient image if it hasn't been collected
  void render() {
    collectItem();
    if (!collected) {
      image(gameIMG, x, y);
    }
  }
  
  //renders the instructions message 
  void renderMsg() {
    if(this.inRange() && !collected) {
      Message message = new Message("press 'c' to collect");
      message.render();
    }
  }
}
