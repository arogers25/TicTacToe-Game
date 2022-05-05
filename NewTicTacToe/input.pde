int mouseGridX = 0, mouseGridY = 0;

void updateMousePos()
{
  mouseGridX = floor(mouseX / pieceSize);
  mouseGridY = floor(mouseY / pieceSize);
}

void mousePressed()
{
  updateMousePos();
  println(mouseGridX, mouseGridY);
}
