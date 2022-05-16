boolean multiPlayerButton = false;
boolean singlePlayerButton = false;
boolean startGameButton = false;
// Make better names for these or make two buttons for each mode
boolean startsButton1 = false; // "Human Starts" in Singleplayer, "X Starts" in Multiplayer
boolean startsButton2 = false; // "AI Starts" in Singleplayer, "O Starts" in Multiplayer

void drawMenu()
{
  //Make all these positions and sizes dynamic
  fill(0);
  textSize(72);
  text("Tic Tac Toe", width / 2, textAscent());
  singlePlayerButton = button("1 Player Mode", (width / 2) - 210, (height / 2) - 100, 200, 50, players == 1 ? color(150) : color(210), color(175));
  multiPlayerButton = button("2 Player Mode", (width / 2) + 10, (height / 2) - 100, 200, 50, players == 2 ? color(150) : color(210), color(175));
  startGameButton = button("Play", (width / 2) - 50, (height / 2) - 25, 100, 50, color(0, 200, 0), color(50, 170, 50));
  
  startsButton1 = button(players == 1 ? "Human Starts" : "X Starts", (width / 2) - 210, (height / 2) - 160, 200, 50, startingSide == 'X' ? color(150) : color(210), color(175));
  startsButton2 = button(players == 1 ? "AI Starts" : "O Starts", (width / 2) + 10, (height / 2) - 160, 200, 50, startingSide == 'O' ? color(150) : color(210), color(175));
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
  if (startsButton1)
  {
    startingSide = 'X';
  }
  if (startsButton2)
  {
    startingSide = 'O';
  }
}
