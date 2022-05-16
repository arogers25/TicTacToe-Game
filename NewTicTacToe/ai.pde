int delayTimer = 0;
int selectedDifficulty = 2; // 0 is Easy (random), 1 is Medium, 2 is Impossible

int minimax(int depth, boolean maximizing)
{
  char score = getWinner();
  if (depth == 0 || score != 0)
  {
    if (score == 'T') return 0;
    if (score == aiSide) return 10; 
    else return -10; // Should be assigned to sides instead of relative to the AI
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

int[] getBestPlace(int difficulty) // Get the best place on the board
{
  int[] move = {-1, -1};
  int bestValue = -99999;
  ArrayList<int[]> emptyPlaces = getEmptyPlaces();
  for (int[] i : emptyPlaces)
  {
    board[i[0]][i[1]] = aiSide; // Initial move
    int value = minimax(9, false);
    board[i[0]][i[1]] = 0;
    if (value > bestValue)
    {
      bestValue = value;
      move[0] = i[0];
      move[1] = i[1];
    }
  }
  int[] randomPlace = emptyPlaces.get(floor(random(0, emptyPlaces.size())));
  switch (difficulty)
  {
  case 0: // Easy, random
    {
      return randomPlace;
    }
  case 1: // Medium
    {
      int randChance = floor(random(1, 3)); // 50% chance between perfect move and random move
      println(randChance == 1 ? "Random Move" : "Perfect Move");
      return randChance == 1 ? randomPlace : move;
    }
  default: // Impossible
    {
      return move;
    }
  }
}

void doAiMove()
{
  if (millis() >= delayTimer + random(500, 3500))
  {
    int[] move = getBestPlace(selectedDifficulty);
    doMove(move[0], move[1]);
  }
}
