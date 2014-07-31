//currently broken code

//Implementation of Conway's Game of Life

/*
Rules:
  1. > 3 neighbors: dies of overcrowding
  2. < 2 neighbors: dies of under-population
  3. 2 - 3 neighbors: survives
  4. exactly 3 neighbors: new cell spawns  
*/

int cols = 30;
int rows = 30;
int state = 0;
boolean[][] board = new boolean[cols][rows];
boolean[][] temp = new boolean[cols][rows];
int tempsum;
int count;
boolean run = true;

void setup() {
  size(302, 500);
  background(255);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = false;
      temp[i][j] = false;
    }
  }
}

void draw() {
  fill(255, 0, 0);
  noStroke();
  rect(50, 450, 200, 20, 5);
  if (mousePressed && mouseY > 301){
    if (state == 0){
      run = !run;
      state = 1;
    }
  }
  else{
    state = 0;
  }
  if (!run){
    text("PAUSE", 280, 450);
  }
  
  if (mousePressed && mouseY < 301){
    if (state == 0){
      board[mouseX / 10][mouseY / 10] = !board[mouseX / 10][mouseY / 10];
      state = 1;
    }
  }
  else{
    state = 0;
  }
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      stroke(255);
      if (board[i][j] == true){
        fill(0);
      }
      else{
        fill(255);
      }
      rect(i * 10, j * 10, 10, 10);
      
      if (board[i][j] == true){
        print("1");
      }
      else if (board[i][j] == false){
        print("0");
      }
        
        

      count = neighborcount(i, j);
        
      if (count < 2){
        temp[i][j] = false;
      }
      else if (count > 3){
        temp[i][j] = false;
      }
      else if (count == 3 && !board[i][j]){
        temp[i][j] = true;
      }
      else{
        temp[i][j] = true;
      }        
    }
  }
  
  print("\n");
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = temp[i][j];
    }
  }
}

boolean retrieve_state(int x, int y) {
  // Retrive matrix cell value with overflow/underflow detection
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

int neighborcount(int i, int j) {
  int neighborcount = 0;
  if (retrieve_state(i - 1, j - 1)){
    neighborcount++;
  }
  if (retrieve_state(i + 0, j - 1)){
    neighborcount++;
  }
  if (retrieve_state(i + 1, j - 1)){
    neighborcount++;
  }
  if (retrieve_state(i - 1, j + 0)){
    neighborcount++;
  }
  if (retrieve_state(i + 1, j + 0)){
    neighborcount++;
  }
  if (retrieve_state(i - 1, j + 1)){
    neighborcount++;
  }
  if (retrieve_state(i + 0, j + 1)){
    neighborcount++;
  }
  if (retrieve_state(i + 1, j + 1)){
    neighborcount++;
  }
  return neighborcount;
}
