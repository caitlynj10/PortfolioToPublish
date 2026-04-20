

class SudokuGame{

    createBoard(){
        let board = Array.from({ length: 9 }, () => new Array(9).fill(0));
        this.checkValidBoard(board);
        return board;
    };

    checkValidBoard(board){
        for (let i = 0; i < 9; i++) {
            for (let j = 0; j < 9; j++) {
                if (board[i][j] == 0) { 
                    let nums = [];
                    for (let k = 1; k <= 9; k++) nums.push(k);
                    this.shuffleArray(nums);
                    for (let num of nums) {
                        if (this.checkRows(num, board, i) && this.checkColumns(num, board, j) && this.checkSquare(num, board, i, j)) {
                            board[i][j] = num;
                            if (this.checkValidBoard(board)) { 
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

    printBoard(board){  
        for(let i = 0; i < board.length; i++){
            for(let j = 0; j < board[i].length; j++){
                console.log(board[i][j] + " ");
            }
            console.log();   
        }

    }

    checkRows(rowVal, board, row) {
        for(let i = 0; i<9; i++){
            if(board[row][i] == rowVal){
                return false;
            }
        }
        return true;
    }

    checkColumns(colVal, board, col){
        for(let j = 0; j<9; j++){
            if(board[j][col] == colVal){
                return false;
            }
        }
        return true;
    }
    
    checkSquare(num, board, row, col){
        let startRow = row - (row % 3);
        let startCol = col - (col % 3);
        for(let i = startRow; i < startRow + 3; i++){
            for(let j = startCol; j < startCol + 3; j++){
                if(board[i][j] == num){
                    return false;
                }
            }
                
        }

        return true;
    }

    easyBoard(board){
        for(let i = 0; i < board.length; i++){
            let removeNums = Math.floor(Math.random() * 2) + 3;
            this.removeFromRow(board, i, removeNums);
        }
    
    }

    mediumBoard(board){
        for(let i = 0; i < board.length; i++){
            let removeNums = Math.floor(Math.random() * 2) + 4;
            this.removeFromRow(board, i, removeNums);
        }
    

    }

    hardBoard(board){
        for(let i = 0; i < board.length; i++){
            let removeNums = Math.floor(Math.random() * 2) + 5;
            this.removeFromRow(board, i, removeNums);
        }
    

    }

    removeFromRow(board, row, countVals){
        let removedVals = 0;
        while(removedVals < countVals){
            let col = Math.floor(Math.random() * 9);
            if(board[row][col] != 0){
                board[row][col] = 0;
                removedVals++;
            }
        }

    }
        
    
   puzzleBoard(board){
        
        for(let i = 0; i < board.length; i+=6){
            for(let j = 0; j < board[i].length; j+=6){
                board[i][j] = 0;
            }
        }
        return board;


    }

    copyBoard(a,b){
        for (let r = 0; r < 9; r++) {
            for (let c = 0; c < 9; c++) {
                a[r][c] = b[r][c];
            }
        }
    }

    completedBoard(empty, complete){
        for(let i = 0; i < empty.length; i++){
            for(let j = 0; j < empty[i].length; j++){
                if(empty[i][j] != complete[i][j]){
                    return false;
                }
            }
        }
        return true;
    }

    countOnes(board, solution){
        let count = 0;
        for(let i = 0; i < board.length; i++){
            for(let j = 0; j < board[i].length; j++){
                if(board[i][j] == 1 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    countTwos(board, solution){
        let count = 0;
        for(let i = 0; i < board.length; i++){
            for(let j = 0; j < board[i].length; j++){
                if(board[i][j] == 2 && board[i][j] == solution[i][j]){
                    count++;

                }
            }
        }
        return count;
    }

    countThrees(board, solution){
        let count = 0;
        for(let i = 0; i < board.length; i++){
            for(let j = 0; j < board[i].length; j++){
                if(board[i][j] == 3 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    countFours(board, solution){
        let count = 0;
        for(let i = 0; i < board.length; i++){
            for(let j = 0; j < board[i].length; j++){
                if(board[i][j] == 4 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    countFives(board, solution){
        let count = 0;
        for(let i = 0; i < board.length; i++){
            for(let j = 0; j < board[i].length; j++){
                if(board[i][j] == 5 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    countSixes(board, solution){
        let count = 0;
        for(let i = 0; i < board.length; i++){
            for(let j = 0; j < board[i].length; j++){
                if(board[i][j] == 6 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    countSevens(board, solution){
        let count = 0;
        for(let i = 0; i < board.length; i++){
            for(let j = 0; j < board[i].length; j++){
                if(board[i][j] == 7 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    countEights(board, solution){
        let count = 0;
        for(let i = 0; i < board.length; i++){
            for(let j = 0; j < board[i].length; j++){
                if(board[i][j] == 8 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    countNines(board, solution){
        let count = 0;
        for(let i = 0; i < board.length; i++){
            for(let j = 0; j < board[i].length; j++){
                if(board[i][j] == 9 && board[i][j] == solution[i][j]){
                    count++;
                }
            }
        }
        return count;
    }

    allNums(nums){
        if(nums != 9){
            return false;
        }
        return true;
    }
    

}

window.SudokuGame = SudokuGame;