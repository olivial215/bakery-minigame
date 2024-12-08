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
