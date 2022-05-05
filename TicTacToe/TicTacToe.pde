int currentSide = 1; // X is 1, O is 2
int winner = 0; // The side that has won the game, 3 is tie
int playerSide = 1; // The side the player is on if the game is singleplayer
int movesPlayed = 0;
boolean multiPlayer = true;

void setup()
{
  size(700, 700);
  grid = new int[gridAmount][gridAmount];
  strokeCap(SQUARE); // Makes lines square instead of rounded
  gameFont = createFont("Arial", 64);
  textFont(gameFont);
  textAlign(CENTER, CENTER);
}

void doMove(int x, int y)
{
  if (grid[x][y] == 0)
  {
    movesPlayed++;
    grid[x][y] = currentSide;
    currentSide = (currentSide == 1 ? 2 : 1);
  }
}

void doAiMove()
{
  int randomPosX = floor(random(gridAmount));
  int randomPosY = floor(random(gridAmount));
  while (grid[randomPosX][randomPosY] > 0)
  {
    randomPosX = floor(random(gridAmount));
    randomPosY = floor(random(gridAmount));
  }
  doMove(randomPosX, randomPosY);
}

void draw()
{
  background(255);
  getWinner();
  if (currentSide == 1) drawX(10, 10);
  if (currentSide == 2) drawO(10, 10);
  drawGrid(400);
  if (winner == 0)
  {
    if (currentSide != playerSide && !multiPlayer)
    {
      doAiMove();
    }
  } else
  {
    textSize(64);
    if (winner == 3)
    {
      fill(0);
      text("Tie", width / 2, 75);
    } else
    {
      fill(winner == 1 ? color(255, 0, 0) : color(0, 0, 255));
      text(((winner == 1 ? "X" : "O") + " Wins"), width / 2, 75);
    }
  }
  drawGui();
}

void mousePressed()
{
  mousePressedGui();
  if (winner > 0) return; // Only allow input if the game does not have a winner
  int mouseGridX = floor((float(mouseX) - float(gridPosX)) / float(gridSize));
  int mouseGridY = floor((float(mouseY) - float(gridPosY)) / float(gridSize));
  if (mouseGridX >= 0 && mouseGridX < gridAmount && mouseGridY >= 0 && mouseGridY < gridAmount) // If the mouse is in bounds of the grid
  {
        println(mouseGridX, mouseGridY, (mouseX - gridPosX) / gridSize);
    if (mouseButton == LEFT)
    {
      if ((!multiPlayer && playerSide == currentSide) || multiPlayer)
        doMove(mouseGridX, mouseGridY);
    }
    if (mouseButton == RIGHT)
    {
      grid[mouseGridX][mouseGridY] = grid[mouseGridX][mouseGridY] == 1 ? 2 : 1;
    }
  }
}
