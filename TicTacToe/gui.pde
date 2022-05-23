boolean resetButton = false;
boolean resetScoreboardButton = false;
boolean exitButton = false;
boolean switchSideButton = false;
boolean backToMenuButton = false;
float buttonWidth = 0;
float buttonHeight = 0;

boolean button(String label, float x, float y, float w, float h, int col, int outlineCol)
{
  boolean hovering = mouseInBounds(x, y, w, h);
  strokeWeight(3.0);
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

  if (winner != 0)
  {
    noStroke();
    textSize(50);
    if (winner == 'T')
    {
      fill(170, 170, 170, 150);
      rect(boardX, boardY, boardWidth, boardWidth);
      fill(0);
      text("Tie", boardX + (boardWidth / 2), boardY + (boardWidth / 2) - textAscent());
    } 
    else
    {
      fill(winner == 'X' ? color(255, 0, 0) : color(0, 0, 255), 150);
      rect(boardX, boardY, boardWidth, boardWidth);
      fill(255);
      if (players == 0 || players == 2)
      {
        text(winner + " Wins", boardX + (boardWidth / 2), boardY + (boardWidth / 2) - textAscent());
      }
      else
      {
        text("You " + ((winner == playerSide) ? "Win" : "Lose"), boardX + (boardWidth / 2), boardY + (boardWidth / 2) - textAscent());
      }
    }
  }
}

void drawCurrentPiece()
{
  fill(winner == 0 ? 200 : 120);
  noStroke();
  rect((buttonWidth / 4) - 10, lineGap - 10, lineGap + 30, lineGap + 30);
  drawPiece((buttonWidth / 4) + 5, lineGap + 5, currentSide, false);
}

void guiInput()
{
  if (backToMenuButton)
  {
    state = 0;
  }
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
  if (updateMousePos() && winner == 0 && !resetButton)
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

void drawGui()
{
  drawScore();
  drawCurrentPiece();

  backToMenuButton = button("Back to Menu", width - buttonWidth - 10, buttonHeight + 20, buttonWidth, buttonHeight, color(210), color(175));
  resetScoreboardButton = button("Reset Score", 10, 10, buttonWidth, buttonHeight, color(210), color(175));

  if (winner != 0) resetButton = button("Play Again", boardX + (boardWidth / 2) - (buttonWidth / 2), boardY + (boardWidth / 2), buttonWidth, buttonHeight, color(210), color(175));
  else resetButton = false; // To prevent placing a piece when the reset button is clicked
  
  //switchSideButton = button("", lineGap - 10, height - pieceSize - 10, lineGap + 20, lineGap + 20, color(210), color(175));
  //drawPiece(lineGap, height - pieceSize, currentSide, false);
}
