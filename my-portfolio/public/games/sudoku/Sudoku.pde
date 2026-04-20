SudokuGame engine;

int[][] displayBoard;
int [][] fullBoard;
int cellSize = 60;

int selectedRow = -1;
int selectedCol = -1;
int selectedNumber = 0;
boolean gameStarted = false;
boolean gameWon = false;
String difficulty = "";
int errors = 0;



void setup() {
  size(540, 690); // 9 cells * 60px - Removed P2D for web compatibility
  engine = new SudokuGame();
  
  fullBoard = engine.createBoard();
  displayBoard = new int[9][9];
  difficulty = "Easy";
  
  engine.copyBoard(displayBoard, fullBoard);
  engine.easyBoard(displayBoard);
  
}

void draw() {
  if(gameWon){
    gameEnded();
  }
  else if(!gameStarted){
    startGame();
  }
  else{
    background(255);

    textSize(20);
    fill(0);
    text("Back", 30, 20);
    if(mouseX > 0 && mouseX < 60 && mouseY > 0 && mouseY < 30){
      fill(255, 59, 108);
      text("Back", 30, 20);
    }

    textSize(20);
    fill(0);
    text("Errors: ", 480, 20);
    fill(255, 0, 0);
    text(errors, 520, 20);
    



    
    textSize(30);
    if(difficulty.equals("Easy")){
      fill(0);
      text("Level: ", width/2-30, 20);
      fill(12,140,0);
      text(difficulty, width/2 + 45, 20);
    }
    if(difficulty.equals("Medium")){
      fill(0);
      text("Level: ", width/2-50, 20);
      fill(224, 123, 0);
      text(difficulty, width/2 + 40, 20);
    }
    if(difficulty.equals("Hard")){
      fill(0);
      text("Level: ", width/2-30, 20);
      fill(255, 0, 0);
      text(difficulty, width/2 + 45, 20);
    }
    
    
    highlightSelected();
    drawGrid();
    drawNumbers();
    displayNumbers();

    if(engine.completedBoard(displayBoard, fullBoard)){
      gameWon = true;
    }
  }


  
 
}



void startGame(){

  background(255);
  stroke(0);
  strokeWeight(1);

  textAlign(CENTER, TOP);
  textSize(40);
  text("Play Sudoku", width/2, 50);
  fill(255, 158, 231);
  rect(170, 240, 200, 100, 28);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("Start Game", 270, 290);

  if(mouseX > 170 && mouseX < 370 && mouseY > 240 && mouseY < 340){
      fill(255, 0, 192);
      rect(170, 240, 200, 100, 28);
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(30);
      text("Start Game", 270, 290);
  }

  if(difficulty.equals("Easy")){
    fill(255, 0, 192);
  }
  else{
    fill(255, 158, 231);
  }
  rect(70, 400, 100, 50, 28);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Easy", 120, 425);

  if(difficulty.equals("Medium")){
    fill(255, 0, 192);
  }
  else{
    fill(255, 158, 231);
  }
  rect(220, 400, 100, 50, 28);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Medium", 270, 425);

  if(difficulty.equals("Hard")){
    fill(255, 0, 192);
  }
  else{
    fill(255, 158, 231);
  }
  rect(370, 400, 100, 50, 28);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Hard", 420, 425);
 
}

void gameEnded(){
  stroke(0);
  strokeWeight(1);
  fill(103, 191, 235);
  rect(70, 195, 400, 300, 20);
  textAlign(CENTER, CENTER);
  textSize(50);
  fill(255, 0, 0);
  text("Puzzle Complete!", width/2, 260);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Total Errors: " + errors, width/2, 320);
  
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("Press Enter to Play Again", width/2, 450);
}

void setGameDifficulty(int [][] board){
  
  if(mouseX > 70 && mouseX < 170 && mouseY > 400 && mouseY < 450){
    engine.copyBoard(board, fullBoard);
    difficulty = "Easy";
    engine.easyBoard(board);
  }
  else if(mouseX > 220 && mouseX < 320 && mouseY > 400 && mouseY < 450){
    engine.copyBoard(board, fullBoard);
    difficulty = "Medium";
    engine.mediumBoard(board);
  }
  else if(mouseX > 370 && mouseX < 470 && mouseY > 400 && mouseY < 450){
    engine.copyBoard(board, fullBoard);
    difficulty = "Hard";
    engine.hardBoard(board);
  }
  
}

void drawGrid() {
  stroke(0);
  for (int i = 0; i <= 9; i++) {
    if (i % 3 == 0) {
      strokeWeight(4);
    } else {
      strokeWeight(1);
    }
    line(i * cellSize, 50, i * cellSize, 590);
    line(0, i * cellSize + 50, width, i * cellSize + 50);
  }
}

void drawNumbers() {
  textAlign(CENTER, CENTER);
  textSize(32);
  fill(0);
  
  for (int row = 0; row < 9; row++) {
    for (int col = 0; col < 9; col++) {
      int value = displayBoard[row][col];
      if (value != 0) {
        if(value != fullBoard[row][col]){
          fill(255, 48, 48);
        }
        else{
          fill(0);
        }
        text(value, col * cellSize + cellSize/2, row * cellSize + cellSize/2 + 50);
      }
    }
  }
}

void displayNumbers(){
  textAlign(CENTER, CENTER);
  textSize(32);
  fill(0);

  float displayY = 620;
  float itemWidth = width / 9.0;

  for (int i = 1; i <= 9; i++) {
    float x = (i - 1) * itemWidth + itemWidth / 2;
    boolean isHovering = mouseX > (i - 1) * itemWidth && mouseX < i * itemWidth && mouseY > 620 && mouseY < 670;
    if(mousePressed && isHovering){
      fill(200,200,255);
      noStroke();
      rect((i - 1) * itemWidth + 5, displayY, itemWidth - 10, 50);
    }
    
    fill(0); 
    text(i, x, displayY + 25);
    noFill();
    stroke(0);
    strokeWeight(2);
    rect((i - 1) * itemWidth + 5, displayY, itemWidth - 10, 50);
  }
  colorNumbers();
  
}

void colorNumbers(){
  float displayY = 620;
  float itemWidth = width / 9.0;
  
  if(engine.allNums(engine.countOnes(displayBoard, fullBoard))){
     
      fill(186, 186, 186);
      noStroke();
      rect((1 - 1) * itemWidth + 5, displayY, itemWidth - 10, 50);
      fill(0);
      text(1, (1 - 1) * itemWidth + itemWidth / 2, displayY + 25);
      

    }

    if(engine.allNums(engine.countTwos(displayBoard, fullBoard))){
      fill(186, 186, 186);
      noStroke();
      rect((2 - 1) * itemWidth + 5, displayY, itemWidth - 10, 50);
      fill(0);
      text(2, (2 - 1) * itemWidth + itemWidth / 2, displayY + 25);
    }

    if(engine.allNums(engine.countThrees(displayBoard, fullBoard))){
      fill(186, 186, 186);
      noStroke();
      rect((3 - 1) * itemWidth + 5, displayY , itemWidth - 10, 50);
      fill(0);
      text(3, (3 - 1) * itemWidth + itemWidth / 2, displayY + 25);
    }

    if(engine.allNums(engine.countFours(displayBoard, fullBoard))){
      fill(186, 186, 186);
      noStroke();
      rect((4 - 1) * itemWidth + 5, displayY, itemWidth - 10, 50);
      fill(0);
      text(4, (4 - 1) * itemWidth + itemWidth / 2, displayY + 25);
    }

    if(engine.allNums(engine.countFives(displayBoard, fullBoard))){
      fill(186, 186, 186);
      noStroke();
      rect((5 - 1) * itemWidth + 5, displayY, itemWidth - 10, 50);
      fill(0);
      text(5, (5 - 1) * itemWidth + itemWidth / 2, displayY + 25);
    }

    if(engine.allNums(engine.countSixes(displayBoard, fullBoard))){
      fill(186, 186, 186);
      noStroke();
      rect((6 - 1) * itemWidth + 5, displayY , itemWidth - 10, 50);
      fill(0);
      text(6, (6 - 1) * itemWidth + itemWidth / 2, displayY + 25);
    }

    if(engine.allNums(engine.countSevens(displayBoard, fullBoard))){
      fill(186, 186, 186);
      noStroke();
      rect((7 - 1) * itemWidth + 5, displayY, itemWidth - 10, 50);
      fill(0);
      text(7, (7 - 1) * itemWidth + itemWidth / 2, displayY + 25);
    }

    if(engine.allNums(engine.countEights(displayBoard, fullBoard))){
      fill(186, 186, 186);
      noStroke();
      rect((8 - 1) * itemWidth + 5, displayY, itemWidth - 10, 50);
      fill(0);
      text(8, (8 - 1) * itemWidth + itemWidth / 2, displayY + 25);
    }

    if(engine.allNums(engine.countNines(displayBoard, fullBoard))){
      fill(186, 186, 186);
      noStroke();
      rect((9 - 1) * itemWidth + 5, displayY, itemWidth - 10, 50);
      fill(0);
      text(9, (9 - 1) * itemWidth + itemWidth / 2, displayY + 25);
    }
}

void mousePressed() {

  if(!gameStarted){
    setGameDifficulty(displayBoard);

    if(mouseX > 170 && mouseX < 370 && mouseY > 240 && mouseY < 340){
      gameStarted = true;
    }
  }

  if(mouseX > 0 && mouseX < 60 && mouseY > 0 && mouseY < 30){
    gameWon = false;
    gameStarted = false;
    selectedRow = -1;
    selectedCol = -1;
    errors = 0;
    fullBoard = engine.createBoard();
    engine.copyBoard(displayBoard, fullBoard);
    difficulty = "Easy";
    engine.easyBoard(displayBoard);
  }

  if (mouseY < 590 && mouseY >= 50) {
    int r = (mouseY - 50) / cellSize;
    int c = mouseX / cellSize;
  
    if (r >= 0 && r < 9 && c >= 0 && c < 9) {
      if(displayBoard[r][c] == 0 || displayBoard[r][c] != fullBoard[r][c]){
        if (r == selectedRow && c == selectedCol) {
          selectedRow = -1;
          selectedCol = -1;
        } 
        else {
          selectedRow = r;
          selectedCol = c;
          selectedNumber = 0;
        }
      }

      else if (displayBoard[r][c] != 0) {
        if(displayBoard[r][c] == fullBoard[r][c]){
          if (selectedNumber == displayBoard[r][c]) {
          selectedNumber = 0;
          }
          else{
            selectedNumber = displayBoard[r][c];
          }

        }
         
        selectedRow = -1;
        selectedCol = -1;
      }
      
     }
  } 

  else if(mouseY>620 && mouseY<670){
    if(mouseX >= 0 && mouseX < width){
      int clicked = int(mouseX / (width / 9.0)) + 1;  
      
      if(selectedRow != -1 && selectedCol != -1){
        if(displayBoard[selectedRow][selectedCol] == clicked && displayBoard[selectedRow][selectedCol] != fullBoard[selectedRow][selectedCol]){
          displayBoard[selectedRow][selectedCol] = 0;
        }
        else{
          displayBoard[selectedRow][selectedCol] = clicked;
          if (fullBoard[selectedRow][selectedCol] == clicked) {
            selectedNumber = clicked;
            selectedRow = -1;
            selectedCol = -1;
            
            
          }
          else{
            errors++;
          }

        }
        
      }
      
    }
 
  }
}

void keyPressed(){
  if(gameWon && key == ENTER){
    gameWon = false;
    gameStarted = false;
    selectedRow = -1;
    selectedCol = -1;
    errors = 0;
    fullBoard = engine.createBoard();
    engine.copyBoard(displayBoard, fullBoard);
    difficulty = "Easy";
    engine.easyBoard(displayBoard);

  }

  if((key == BACKSPACE || key == DELETE) && selectedRow != -1 && selectedCol != -1){
    if(displayBoard[selectedRow][selectedCol] != 0 && displayBoard[selectedRow][selectedCol] != fullBoard[selectedRow][selectedCol]){
      displayBoard[selectedRow][selectedCol] = 0;
      return;
    }

  }
  if (key >= '1' && key <= '9') {
    selectedNumber = key - '0';
    if(selectedRow != -1 && selectedCol != -1){
      if(displayBoard[selectedRow][selectedCol] == selectedNumber && displayBoard[selectedRow][selectedCol] != fullBoard[selectedRow][selectedCol]){
        displayBoard[selectedRow][selectedCol] = 0;
      }
      else{
        displayBoard[selectedRow][selectedCol] = selectedNumber;
        if (fullBoard[selectedRow][selectedCol] == selectedNumber) {
          selectedRow = -1;
          selectedCol = -1;
          
          
        }
        else {
          errors++;
        }

      }
    }
  }
}

void highlightSelected() {
  if (selectedRow != -1 && selectedCol != -1) {
    int val = displayBoard[selectedRow][selectedCol];
    if(val != 0 && val != fullBoard[selectedRow][selectedCol]){
      fill(196, 196, 196);    
    }
    else{
      fill(120, 255, 121);

    }
    
    
    noStroke();
    rect(selectedCol*cellSize, selectedRow * cellSize + 50, cellSize, cellSize);
  }
 
  else if (selectedNumber > 0) {
    
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        if (displayBoard[r][c] == selectedNumber && displayBoard[r][c] == fullBoard[r][c]) {
          fill(120, 255, 121);
          noStroke();
          rect(c * cellSize, r * cellSize + 50, cellSize, cellSize);
        }
      }
    }
  }
}

class SudokuGame {
  int[][] createBoard() {
    int[][] board = new int[9][9];
    solve(board);
    return board;
  }

  boolean solve(int[][] board) {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (board[i][j] == 0) {
          int[] nums = {1, 2, 3, 4, 5, 6, 7, 8, 9};
          for (int k = 0; k < 9; k++) {
            int r = (int)random(9);
            int temp = nums[k];
            nums[k] = nums[r];
            nums[r] = temp;
          }
          for (int n : nums) {
            if (isValid(board, i, j, n)) {
              board[i][j] = n;
              if (solve(board)) return true;
              board[i][j] = 0;
            }
          }
          return false;
        }
      }
    }
    return true;
  }

  boolean isValid(int[][] board, int row, int col, int num) {
    for (int i = 0; i < 9; i++) {
      if (board[row][i] == num || board[i][col] == num) return false;
    }
    int r = row - row % 3;
    int c = col - col % 3;
    for (int i = r; i < r + 3; i++) {
      for (int j = c; j < c + 3; j++) {
        if (board[i][j] == num) return false;
      }
    }
    return true;
  }

  void copyBoard(int[][] dest, int[][] src) {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        dest[i][j] = src[i][j];
      }
    }
  }

  void easyBoard(int[][] board) { removeNumbers(board, 30); }
  void mediumBoard(int[][] board) { removeNumbers(board, 45); }
  void hardBoard(int[][] board) { removeNumbers(board, 55); }

  void removeNumbers(int[][] board, int count) {
    int removed = 0;
    while (removed < count) {
      int r = (int)random(9);
      int c = (int)random(9);
      if (board[r][c] != 0) {
        board[r][c] = 0;
        removed++;
      }
    }
  }

  boolean completedBoard(int[][] display, int[][] full) {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (display[i][j] == 0 || display[i][j] != full[i][j]) return false;
      }
    }
    return true;
  }

  int countOnes(int[][] board, int[][] full) { return countNum(board, full, 1); }
  int countTwos(int[][] board, int[][] full) { return countNum(board, full, 2); }
  int countThrees(int[][] board, int[][] full) { return countNum(board, full, 3); }
  int countFours(int[][] board, int[][] full) { return countNum(board, full, 4); }
  int countFives(int[][] board, int[][] full) { return countNum(board, full, 5); }
  int countSixes(int[][] board, int[][] full) { return countNum(board, full, 6); }
  int countSevens(int[][] board, int[][] full) { return countNum(board, full, 7); }
  int countEights(int[][] board, int[][] full) { return countNum(board, full, 8); }
  int countNines(int[][] board, int[][] full) { return countNum(board, full, 9); }

  int countNum(int[][] board, int[][] full, int n) {
    int count = 0;
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (board[i][j] == n && board[i][j] == full[i][j]) count++;
      }
    }
    return count;
  }

  boolean allNums(int count) { return count == 9; }
}
