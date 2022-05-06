int mouseGridX = 0, mouseGridY = 0;

boolean mouseInBounds(float x, float y, float w, float h)
{
  return (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h);
}

boolean updateMousePos()
{
  mouseGridX = floor((mouseX - boardX) / pieceSize);
  mouseGridY = floor((mouseY - boardY) / pieceSize);
  return (mouseGridX >= 0 && mouseGridX < boardSize && mouseGridY >= 0 && mouseGridY <= boardSize);
}

void mousePressed()
{
  if (singlePlayerButton)
  {
    players = 1;
    setupBoard(boardX, boardY, boardWidth);
  }
  if (multiPlayerButton)
  {
    players = 2;
    setupBoard(boardX, boardY, boardWidth);
  }
  if (resetButton)
  {
    setupBoard(boardX, boardY, boardWidth);
  }
  if (exitButton)
  {
    exit();
  }
  if (updateMousePos())
  {
    if (board[mouseGridX][mouseGridY] == 0)
    {
      println(mouseGridX, mouseGridY);
      doMove(mouseGridX, mouseGridY);
    }
  }
}
