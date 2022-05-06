int delayTimer = 0;

void doAiMove()
{
  if (currentSide == aiSide && winner == 0)
  {
    int randomX = floor(random(0, boardSize));
    int randomY = floor(random(0, boardSize));
    if (board[randomX][randomY] == 0)
    {
      if (millis() >= delayTimer + random(500, 3500)) doMove(randomX, randomY);
      //println(delayTimer, millis());
    }
  }
  else
  {
    delayTimer = millis();
  }
}
