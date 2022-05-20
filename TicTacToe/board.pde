float pieceSize, lineGap;
float boardX, boardY, boardWidth;

void setupBoard(float x, float y, float w)
{
  boardX = x;
  boardY = y;
  boardWidth = w;

  board = new char[boardSize][boardSize];
  pieceSize = w / (float)boardSize;
  lineGap = pieceSize / 2;
  currentSide = startingSide;
  winner = 0;
  movesMade = 0;
}

void drawPiece(float x, float y, char piece, boolean onBoard)
{
  if (onBoard)
  {
    x = (boardX + lineGap / 2) + (x * pieceSize);
    y = (boardY + lineGap / 2) + (y * pieceSize);
  }
  switch (piece)
  {
  case 'X':
    {
      stroke(255, 0, 0);
      strokeWeight(9.0);
      line(x, y, x + lineGap, y + lineGap);
      line(x, y + lineGap, x + lineGap, y);
      break;
    }
  case 'O':
    {
      stroke(0, 0, 255);
      strokeWeight(9.0);
      noFill();
      circle(x + lineGap / 2, y + lineGap / 2, lineGap);
      break;
    }
  }
}

void drawBoard()
{
  stroke(200);
  strokeWeight(6.0);
  for (int i = 1; i < boardSize; i++)
  {
    line(boardX, boardY + (i * pieceSize), boardX + boardWidth, boardY + (i * pieceSize));
    line(boardX + (i * pieceSize), boardY, boardX + (i * pieceSize), boardY + boardWidth);
  }
  for (int x = 0; x < boardSize; x++)
  {
    for (int y = 0; y < boardSize; y++)
    {
      drawPiece(x, y, board[x][y], true);
    }
  }
}
