class SudokuGame{

    public int[][] createBoard(){
        int[][] board = new int[9][9];
        checkValidBoard(board);
    
        return board;
    }

    public boolean checkValidBoard(int[][] board){
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                if (board[i][j] == 0) { 
                    int[] nums = {1,2,3,4,5,6,7,8,9};
                    for(int k = nums.length-1; k>0; k--){
                        int index = (int)random(k+1);
                        int temp = nums[index];
                        nums[index] = nums[k];
                        nums[k] = temp;

                    }
                    for (int num : nums) {
                        if (checkRows(num, board, i) && checkColumns(num, board, j) && checkSquare(num, board, i, j)) {
                            board[i][j] = num;
                            if (checkValidBoard(board)) { 
                                return true;
                            }
                            board[i][j] = 0; 
                        }
                    }
                    return false; 
                }
            }
        }

        return true;
    }

    public void printBoard(int[][] board){  
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                print(board[i][j] + " ");
            }
        }

    }

    public boolean checkRows(int rowVal, int[][] board, int row) {
        for(int i = 0; i<9; i++){
            if(board[row][i] == rowVal){
                return false;
            }
        }
        return true;
    }

    public boolean checkColumns(int colVal, int[][] board, int col){
        for(int j = 0; j<9; j++){
            if(board[j][col] == colVal){
                return false;
            }
        }
        return true;
    }
    
    public boolean checkSquare(int num, int[][] board, int row, int col){
        int startRow = row - (row % 3);
        int startCol = col - (col % 3);
        for(int i = startRow; i < startRow + 3; i++){
            for(int j = startCol; j < startCol + 3; j++){
                if(board[i][j] == num){
                    return false;
                }
            }
                
        }

        return true;
    }

    public void  easyBoard(int[][] board){
        
        for(int i = 0; i < board.length; i++){
            int removeNums = floor(random(2)) + 3;
            removeFromRow(board, i, removeNums);
        }
    
    }

    public void mediumBoard(int[][] board){
        for(int i = 0; i < board.length; i++){
            int removeNums = floor(random(2)) + 4;
            removeFromRow(board, i, removeNums);
        }
    

    }

    public void hardBoard(int[][] board){
        
        for(int i = 0; i < board.length; i++){
            int removeNums = floor(random(2)) + 5;
            removeFromRow(board, i, removeNums);
        }
    

    }

    public void removeFromRow(int[][] board, int row, int countVals){
        int removedVals = 0;
        while(removedVals < countVals){
            int col = floor(random(9));
            if(board[row][col] != 0){
                board[row][col] = 0;
                removedVals++;
            }
        }

    }
        
    
    public int[][] puzzleBoard(int [][] board){
        
        for(int i = 0; i < board.length; i+=6){
            for(int j = 0; j < board[i].length; j+=6){
                board[i][j] = 0;
            }
        }
        return board;


    }

    public void copyBoard(int [][] a, int [][] b){
        for (int r = 0; r < 9; r++) {
            for (int c = 0; c < 9; c++) {
                a[r][c] = b[r][c];
            }
        }
    }

    public boolean completedBoard(int[][] empty, int[][]  complete){
        for(int i = 0; i < empty.length; i++){
            for(int j = 0; j < empty[i].length; j++){
                if(empty[i][j] != complete[i][j]){
                    return false;
                }
            }
        }
        return true;
    }

    public int countOnes(int [][] board, int [][] solution){
        int count = 0;
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                if(board[i][j] == 1 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    public int countTwos(int [][] board, int [][] solution){
        int count = 0;
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                if(board[i][j] == 2 && board[i][j] == solution[i][j]){
                    count++;

                }
            }
        }
        return count;
    }

    public int countThrees(int [][] board, int [][] solution){
        int count = 0;
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                if(board[i][j] == 3 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    public int countFours(int [][] board, int [][] solution){
        int count = 0;
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                if(board[i][j] == 4 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    public int countFives(int [][] board, int [][] solution){
        int count = 0;
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                if(board[i][j] == 5 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    public int countSixes(int [][] board, int [][] solution){
        int count = 0;
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                if(board[i][j] == 6 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    public int countSevens(int [][] board, int [][] solution){
        int count = 0;
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                if(board[i][j] == 7 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    public int countEights(int [][] board, int [][] solution){
        int count = 0;
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                if(board[i][j] == 8 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    public int countNines(int [][] board, int [][] solution){
        int count = 0;
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                if(board[i][j] == 9 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    public boolean allNums(int nums){
        if(nums != 9){
            return false;
        }
        return true;
    }
    

}