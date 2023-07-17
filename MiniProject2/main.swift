import Foundation

func solveQueens(board: inout Board) {
    var count = 0
    
    func backtrack(col: Int) -> Bool {
        count += 1
        
        if col >= board.size {
            print(board)
            return true
        }
        
        for row in 0..<board.size {
            if board.isSafe(row: row, col: col) {
                board.place(row: row, col: col)
                if backtrack(col: col + 1) {
                    return true
                }
                board.remove(row: row, col: col)
            }
        }
        
        return false
    }
    
    backtrack(col: 0)
    
    print("Number of recursive calls:", count)
}

var board = Board(size: 8)
solveQueens(board: &board)
