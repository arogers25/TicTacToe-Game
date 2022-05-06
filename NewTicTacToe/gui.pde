boolean multiPlayerButton = false;
boolean singlePlayerButton = false;
boolean resetButton = false;
boolean exitButton = false;

boolean button(String label, float x, float y, float w, float h, int col, int outlineCol)
{
  boolean hovering = mouseInBounds(x, y, w, h);
  strokeWeight(2.0);
  stroke(outlineCol);
  fill(col);
  rect(x, y, w, h);
  fill(0);
  float size = h / 3;
  textSize(size);
  while (textWidth(label) > w) textSize(size--);
  text(label, x + w / 2, (y + h / 2) - textDescent() / 2);
  if (hovering)
  {
    fill(255, 255, 255, 100);
    rect(x, y, w, h);
  }
  return hovering;
}

void drawScore()
{
  textSize(72);
  fill(0);
  text(scoreX + " - " + scoreO, width / 2, 70);
}

void drawGui()
{
  drawScore();
  
  singlePlayerButton = button("1 Player Mode", 10, 10, 200, 50, players == 1 ? color(150) : color(210), color(175));
  multiPlayerButton = button("2 Player Mode", 10, 70, 200, 50, players == 2 ? color(150) : color(210), color(175));
  
  resetButton = button("Reset", width - 210, 10, 200, 50, color(210), color(175));
  exitButton = button("Exit", width - 210, 70, 200, 50, color(255, 0, 0), color(128, 0, 0));
}
