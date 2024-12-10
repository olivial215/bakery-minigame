/*
Message objects are used when the player is in range of an object 
that can be interacted with.
It takes in a string, which should be instructions for how to interact
with the object in range.
*/
class Message {
  String text;
  float textWidth;
  float x,y;
  
  Message(String text) {
    this.text = text;
    this.textWidth = textWidth(text);
    this.x = width - textWidth/2 - 25;
    this.y = 275;
  }
  
  //renders the message 
  void render() {
    textFont(pixel);
    strokeWeight(2);
    stroke(0);
    fill(#e6a73c);
    rect(x, y - 3, textWidth + 15, 25);
    fill(0);
    textAlign(CENTER);
    text(text, x, y);
  }
}
