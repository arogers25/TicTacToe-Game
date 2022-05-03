boolean closeButtonHovered = false;
boolean resetButtonHovered = false;

boolean mouseInBounds(float x, float y, float w, float h)
{
  return (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h);
}

boolean button(String label, float x, float y, float w, float h, int col)
{
  boolean hovering = mouseInBounds(x, y, w, h);
  stroke(0);
  strokeWeight(1.5);
  fill(col);
  rect(x, y, w, h);
  fill(0);
  textSize(w / 3);
  text(label, x + w/2, (y + h/2) - textDescent());
  if (hovering)
  {
    noStroke();
    fill(255, 255, 255, 100);
    rect(x, y, w, h);
  }
  return hovering;
}

void drawGui()
{
  float closeButtonSize = gridSize * 0.7;
  //println(closeButtonSize / 3);
  closeButtonHovered = button("Exit", width - closeButtonSize - 1.5, 1.5, closeButtonSize, closeButtonSize, color(255, 0, 0));
  
  resetButtonHovered = button("Reset", (width - closeButtonSize * 2) - 1.5, 1.5, closeButtonSize, closeButtonSize, color(128));
}

void mousePressedGui()
{
  if (mouseButton == LEFT)
  {
    if (closeButtonHovered)
    {
      exit();
    }
    if (resetButtonHovered)
    {
      currentSide = playerSide;
      grid = new int[gridAmount][gridAmount];
      winner = 0;
      movesPlayed = 0;
    }
  }
}
