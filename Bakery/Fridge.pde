/* 
The fridge holds ingredients (milk and eggs) for the player to collect.
The player can open and close the fridge by pressing 'e' and collect its 
contents by pressing 'c'. Collected items are added to the inventory.
*/

class Fridge {
  int x,y;
  String type;
  PImage currentIMG, closedFridge, emptyFridge, milkFridge, eggFridge;
  PImage egg, milk;
  boolean closed;
  boolean collected;
  boolean keyProcessed;
  
  Fridge(int x, int y, String type) {
    this.x = x;
    this.y = y;
    this.type = type;
    this.closed = true;
    this.collected = false;
    this.keyProcessed = false; 
    
    closedFridge = loadImage("closedFridge.png");
    emptyFridge = loadImage("emptyFridge.png");
    milkFridge = loadImage("milkFridge.png");
    eggFridge = loadImage("eggFridge.png");
    egg = loadImage("egg.png");
    milk = loadImage("milk.png");
    currentIMG = closedFridge;
    
  }
  
  /* Is the player in front of and facing the fridge? */
  boolean inRange() {
    return (baker.x > x-10 && baker.x < x + 30 
        && baker.y > y + 20 && baker.y < y + 50
        && baker.bakerSprite == baker.bakerUp);
  }
  

  /* 
  Returns the current fridge image based on the status of the fridge 
  If its open and not empty, the image is based on the type string 
  */
  PImage getCurrent() {
    if (closed) {
      return closedFridge;
    } else if (collected) {
      return emptyFridge;
    } else if (this.type == "milk") {
      return milkFridge;
    } else {
      return eggFridge;
    }
  }
  
  /* 
  Adds the collcted item to the inventory and sets fridge to empty.
  This function is used when player presses 'c'.
  */
  void collectItem() {
    if (!collected && inRange()) {
      collected = true;
      if (this.type == "milk") {
        inventory.addItem(milk);
      }
      if (this.type == "egg") {
        inventory.addItem(egg);
      }
    }
  }
  
  /*
  Processes valid key inputs and updates the current fridge image for
  opening/closing fridge and collecting items
  
  The keyProcessed boolean flag ensures the open/close action is only 
  processed once everytime the player presses a key
  */
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
       collectItem();
     }
     
     currentIMG = getCurrent();
  }

  
  /*
  Renders fridge after update 
  */
  void render() {
    updateFridge();
    image(currentIMG, x, y);
  }
  
  void renderMsg() {
    Message openMsg = new Message("press 'e' to open");
    Message closeMsg = new Message("press 'e' to close");
    Message collectMsg = new Message("press 'c' to collect");
    
    if(this.inRange()) {
      if (this.closed) {
        openMsg.render();
      } else if(this.collected) {
        closeMsg.render();
      } else {
        collectMsg.render();
      }
    }
  }
  
}
