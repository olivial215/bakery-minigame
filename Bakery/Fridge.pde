class Fridge {
  int x,y;
  String type;
  PImage currentIMG, closedFridge, emptyFridge, milkFridge, eggFridge;
  boolean closed;
  boolean empty;
  boolean keyProcessed;
  
  Fridge(int x, int y, String type) {
    this.x = x;
    this.y = y;
    this.type = type;
    this.closed = true;
    this.empty = false;
    this.keyProcessed = false;
    
    closedFridge = loadImage("closedFridge.png");
    emptyFridge = loadImage("emptyFridge.png");
    milkFridge = loadImage("milkFridge.png");
    eggFridge = loadImage("eggFridge.png");
    currentIMG = closedFridge;
    
  }
  
  boolean inRange() {
    return (baker.x > x-10 && baker.x < x + 30 
        && baker.y > y + 20 && baker.y < y + 50
        && baker.bakerSprite == baker.bakerUp);
  }
  

  PImage getCurrent() {
    if (closed) {
      return closedFridge;
    } else if (empty) {
      return emptyFridge;
    } else if (this.type == "milk") {
      return milkFridge;
    } else {
      return eggFridge;
    }
  }
  
  void collectItem() {
    if (!empty && inRange()) {
      empty = true;
      if (this.type == "milk") {
        inventory.addMilk();
      }
      if (this.type == "egg") {
        inventory.addMilk();
      }
    }
  }
  
  void updateFridge() {
     if (keyPressed && key == 'e' && !keyProcessed) {
       keyProcessed = true;
       if (inRange()) {
         closed = !closed;
       }
     } else if (!keyPressed) {
       keyProcessed = false;
     }
     
     if (!closed && keyPressed && key == 'c' && !keyProcessed) {
       keyProcessed = true;
       collectItem();
     }
     
     currentIMG = getCurrent();
  }

  
  void render() {
    updateFridge();
    image(currentIMG, x, y);
  }
  
  
}
