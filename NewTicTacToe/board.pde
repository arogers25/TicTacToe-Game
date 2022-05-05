float pieceSize, lineGap;

void setupBoard()
{
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
    line(0, i * pieceSize, width, i * pieceSize);
    line(i * pieceSize, 0, i * pieceSize, height);
  }
}
