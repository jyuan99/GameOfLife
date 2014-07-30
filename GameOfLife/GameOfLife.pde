int cols = 9;
int rows = 9;
int state = 0;
boolean[][] board = new boolean[cols][rows];
boolean[][] temp = new boolean[cols][rows];

void setup() {
  size(271, 271);
  background(255);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = false;
      temp[i][j] = false;
    }
  }
}

void draw() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      stroke(0);
      if (board[i][j] == true){
        fill(0);
      }
      else{
        fill(255);
      }
      rect(i*30, j*30, 30, 30);
      if (board[i][j] == true){
        print("1");
      }
      else if (board[i][j] == false){
        print("0");
      }
    }
  }
  
  print("\n");
  
  if (mousePressed){
    if (state == 0){
      board[mouseX / 30][mouseY / 30] = !board[mouseX / 30][mouseY / 30];
      state = 1;
    }
  }
  else{
    state = 0;
  }
}



