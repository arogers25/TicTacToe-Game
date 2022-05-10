int delayTimer = 0;

int minimax(int depth, boolean maximizing)
{
  char score = getWinner();
  if (depth == 0 || score != 0)
  {
    if (score == 'T') return 0;
    if (score == aiSide) return 10; else return -10; // Should be assigned to sides instead of relative to the AI
  }
  
  if (maximizing)
  {
    int bestValue = -99999;
    for (int[] i : getEmptyPlaces())
    {
      board[i[0]][i[1]] = aiSide;
      int value = minimax(depth - 1, false);
      board[i[0]][i[1]] = 0;
      if (value > bestValue) bestValue = value;
    }
    return bestValue;
  }
  else // If minimizing
  {
    int bestValue = 99999;
    for (int[] i : getEmptyPlaces())
    {
      board[i[0]][i[1]] = playerSide;
      int value = minimax(depth - 1, true);
      board[i[0]][i[1]] = 0;
      if (value < bestValue) bestValue = value;
    }
    return bestValue;
  }
}

void doAiMove()
{
  if (millis() >= delayTimer + random(500, 3500))
  {
    int[] move = {-1, -1};
    int bestValue = -99999;
    for (int[] i : getEmptyPlaces())
    {
      board[i[0]][i[1]] = aiSide;
      int value = minimax(9, false);
      board[i[0]][i[1]] = 0;
      if (value > bestValue)
      {
        bestValue = value;
        move[0] = i[0];
        move[1] = i[1];
      }
    }
    doMove(move[0], move[1]);
  }
}
