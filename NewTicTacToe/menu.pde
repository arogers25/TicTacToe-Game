boolean multiPlayerButton = false;
boolean singlePlayerButton = false;

void drawMenu()
{
  singlePlayerButton = button("1 Player Mode", 10, 10, 200, 50, players == 1 ? color(150) : color(210), color(175));
  multiPlayerButton = button("2 Player Mode", 10, 70, 200, 50, players == 2 ? color(150) : color(210), color(175));
}

void menuInput()
{
}
