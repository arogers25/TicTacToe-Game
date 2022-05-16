int mouseGridX = 0, mouseGridY = 0;

boolean mouseInBounds(float x, float y, float w, float h)
{
  return (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h);
}

boolean updateMousePos()
{
  mouseGridX = floor((mouseX - boardX) / pieceSize);
  mouseGridY = floor((mouseY - boardY) / pieceSize);
  return (mouseGridX >= 0 && mouseGridX < boardSize && mouseGridY >= 0 && mouseGridY < boardSize);
}

void mousePressed()
{
  if (exitButton)
  {
    exit();
  }
  switch (state)
  {
  case 0:
    {
      if (singlePlayerButton)
      {
        players = 1;
        //setupBoard(boardX, boardY, boardWidth);
      }
      if (multiPlayerButton)
      {
        players = 2;
      }
      break;
    }
  case 1:
    {
      {
        if (resetButton)
        {
          setupBoard(boardX, boardY, boardWidth);
        }
        if (resetScoreboardButton)
        {
          resetScore();
          setupBoard(boardX, boardY, boardWidth);
        }
        if (switchSideButton)
        {
          switchSides();
        }
      }
      if (updateMousePos() && winner == 0)
      {
        if (board[mouseGridX][mouseGridY] == 0)
        {
          if (players == 2 || currentSide != aiSide)
          {
            //println(mouseGridX, mouseGridY);
            doMove(mouseGridX, mouseGridY);
          }
        }
      }
    }
  }
}
