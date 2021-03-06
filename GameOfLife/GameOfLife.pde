//Implementation of Conway's Game of Life

/*
Rules:
  1. > 3 neighbors: dies of overcrowding
  2. < 2 neighbors: dies of under-population
  3. 2 - 3 neighbors: survives
  4. exactly 3 neighbors: new cell spawns  
*/

int cols = 75;
int rows = 75;
int state1 = 0, state2 = 0, state3 = 0, state4 = 0;
boolean[][] board = new boolean[cols][rows];
int tempsum;
int count;
boolean pause = false;

void setup() {
  background(255);
  size(761, 800);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = false;
    }
  }
}

void draw() {
  
  if (mousePressed && mouseY < 751){
    if (state1 == 0){
      board[(int) mouseX / 10][(int) mouseY / 10] = !board[(int) mouseX / 10][(int) mouseY / 10];
      state1 = 1;
    }
  }
  else{
    state1 = 0;
  }
  

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      stroke(255);
      if (board[i][j]){
        fill(0);
      }
      else{
        fill(255);
      }
      rect(i * 10, j * 10, 10, 10);
      
      //prints 2D array
//      if (board[i][j]){
//        print("1");
//      }
//      else if (!board[i][j]){
//        print("0");
//      }
        
//      if (!run){
//        count = neighborcount(i, j);
//          
//        if (count < 2){
//          temp[i][j] = false;
//        }
//        else if (count > 3){
//          temp[i][j] = false;
//        }
//        else if (count == 3 && !board[i][j]){
//          temp[i][j] = true;
//        }
//        else{
//          temp[i][j] = true;
//        }
//      }
    }
  }
  
  print("\n");
  
  if ((mousePressed && mouseY > 751 && mouseX > 200 && mouseX < 300) || (keyPressed && keyCode == 32)){
    if (state2 == 0){
      pause = !pause;
      fill(255);
      rect(200, 755, 100, 35);
      fill(0, 255, 0);
      noStroke();
      rect(200, 755, 100, 35, 10);
      fill(0);
      textSize(24);
      text("PLAY", 223, 782);
      state2 = 1;
    }
  }
  else{
    state2 = 0;
  }
  
  
  if (mousePressed && mouseY > 751 && mouseX > 325 && mouseX < 475){
    if (state3 == 0){
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          int random = int(random(0, 2));
          if (random == 0){
            board[i][j] = false;
          }
          else if (random == 1){
            board[i][j] = true;
          }
        }
      }
      state3 = 1;
    }
  }
  else{
    state3 = 0;
  }
  
  if (mousePressed && mouseY > 751 && mouseX > 500 && mouseX < 600){
    if (state4 == 0){
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          board[i][j] = false;
        }
      }
      state4 = 1;
    }
  }
  else{
    state4 = 0;
  }
  
  if (!pause){
    fill(255, 0, 0);
    noStroke();
    rect(200, 755, 100, 35, 10);
    fill(255);
    textSize(24);
    text("PAUSE", 215, 782);
    
    fill(0, 0, 255);
    noStroke();
    rect(325, 755, 150, 35, 10);
    fill(255);
    text("RANDOMIZE", 329, 782);
    
    fill(255, 0, 0);
    noStroke();
    rect(500, 755, 100, 35, 10);
    fill(255);
    text("CLEAR", 513, 782);
    update_world();
  }
  
}

boolean retrieve_state(int x, int y) {
  // Retrieve matrix cell value with overflow/underflow detection
  if (x < 0 || x >= cols || y < 0 || y >= rows){
    return false;
  }
  if (board[x][y]){
    return true;
  }
  else{
    return false;
  }
}

void update_world() {
  boolean[][] temp = new boolean[cols][rows];
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      temp[i][j] = update_cell(i, j);
    }
  }
  board = temp;
}

boolean update_cell(int x, int y) {
  int count = neighborcount(x, y);
  if (count < 2){
    return false;
  }
  else if (count > 3){
    return false;
  }
  else if (count == 3){
    return true;
  }
  return board[x][y];
}

int neighborcount(int x, int y) {
  int neighborcount = 0;
  if (retrieve_state(x - 1, y - 1)){
    neighborcount++;
  }
  if (retrieve_state(x + 0, y - 1)){
    neighborcount++;
  }
  if (retrieve_state(x + 1, y - 1)){
    neighborcount++;
  }
  if (retrieve_state(x - 1, y + 0)){
    neighborcount++;
  }
  if (retrieve_state(x + 1, y + 0)){
    neighborcount++;
  }
  if (retrieve_state(x - 1, y + 1)){
    neighborcount++;
  }
  if (retrieve_state(x + 0, y + 1)){
    neighborcount++;
  }
  if (retrieve_state(x + 1, y + 1)){
    neighborcount++;
  }
  return neighborcount;
}
