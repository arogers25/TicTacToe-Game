int mouseGridX = 0, mouseGridY = 0;

void updateMousePos()
{
  mouseGridX = floor((mouseX - boardX) / pieceSize);
  mouseGridY = floor((mouseY - boardY) / pieceSize);
}

void mousePressed()
{
  updateMousePos();
  println(mouseGridX, mouseGridY);
}
