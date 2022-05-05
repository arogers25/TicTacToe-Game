float pieceSize, lineGap;
float boardX, boardY, boardWidth;

void setupBoard(float x, float y, float w)
{
  boardX = x;
  boardY = y;
  boardWidth = w;
  
  board = new char[boardSize][boardSize];
  pieceSize = width / boardSize;
  lineGap = pieceSize / 2;
  currentSide = startingSide;
}


void drawBoard()
{
  stroke(200);
  strokeWeight(5.0);
  for (int i = 1; i < boardSize; i++)
  {
    line(boardX, boardY + (i * pieceSize), boardX + boardWidth, boardY + (i * pieceSize));
    line(boardX + (i * pieceSize), boardY, boardX + (i * pieceSize), boardY + boardWidth);
  }
}
