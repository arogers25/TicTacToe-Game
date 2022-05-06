boolean button(String label, float x, float y, float w, float h, int col, int outlineCol)
{
  boolean hovering = mouseInBounds(x, y, w, h);
  strokeWeight(4.0);
  stroke(outlineCol);
  fill(col);
  rect(x, y, w, h);
  fill(0);
  float size = w / 3;
  textSize(size);
  while (textWidth(label) > w) textSize(size--);
  text(label, x + w / 2, (y + h / 2) - textDescent() / 2);
  return hovering;
}
