boolean multiPlayerButton = false;
boolean singlePlayerButton = false;
boolean startGameButton = false;
// Make better names for these or make two buttons for each mode
boolean playerSelect1 = false; // "Human Starts" in singleplayer, "X Starts" in multiplayer and 0 player
boolean playerSelect2 = false; // "AI Starts" in singleplayer, "O Starts" in multiplayer and 0 player

void drawSideSelect()
{
  // Make positions easier to understand
  float button1X = (width / 2) - 10 - (buttonWidth / 2) - (lineGap * 0.75);
  float button2X = (width / 2) + 10 + (lineGap * 0.75);
  float buttonsY = (height / 2) - (lineGap * 2);
  
  if (players == 2)
  {
    lineGap = buttonWidth / 3; // Resizes piece for side select button, gets changed back when setupBoard() is called
    button("", button1X, buttonsY, lineGap * 1.5, lineGap * 1.5, color(210), color(175));
    drawPiece(button1X + lineGap * 0.25, buttonsY + lineGap * 0.25, 'X', false);
    
    button("", button2X, buttonsY, lineGap * 1.5, lineGap * 1.5, color(210), color(175));
    drawPiece(button2X + lineGap * 0.25, buttonsY + lineGap * 0.25, 'O', false);
  }
}

void drawMenu()
{
  fill(0);
  textSize(72);
  text("Tic Tac Toe", width / 2, textAscent());
  singlePlayerButton = button("1 Player Mode", (width / 2) - buttonWidth - 10, (height / 1.5) - (buttonWidth / 2), buttonWidth, buttonHeight, players == 1 ? color(150) : color(210), color(175));
  multiPlayerButton = button("2 Player Mode", (width / 2) + 10, (height / 1.5) - (buttonWidth / 2), buttonWidth, buttonHeight, players == 2 ? color(150) : color(210), color(175));
  startGameButton = button("Play", (width / 2) - buttonHeight, (height / 1.5) - (buttonHeight / 2), buttonWidth / 2, buttonHeight, color(0, 200, 0), color(50, 170, 50));

  drawSideSelect();
}

void menuInput()
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
  if (startGameButton)
  {
    resetScore();
    setupBoard(boardX, boardY, boardWidth);
    state = 1;
  }
}
