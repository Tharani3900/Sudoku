package Sudokugsv;

import java.util.HashSet;

public class sudokuvalidator
{
	public static boolean isValidSudoku(String[][] board)
    {
		int row=board.length;
		int col=board[0].length;
		if(row!=col) return false;
		int sqrt= (int)Math.sqrt(row);
        return ( checkgrid(board,row,col,sqrt) && checkrows(board,row,col) && checkcols(board,row,col) );
    }
	
    public static boolean checkgrid(String[][] board,int row,int col,int sqrt)
    {
        for(int i=0;i<row;i=i+sqrt)
            for(int j=0;j<col;j=j+sqrt)
            {
                HashSet<String> set=new HashSet<>();
                for(int r=i;r<i+sqrt;r++)
                    for(int c=j;c<j+sqrt;c++)
                    {
                        if(board[r][c]== "" ) continue;
                        if(set.contains(board[r][c])) return false;
                        else set.add(board[r][c]);
                    }
            }
        return true;
    }
    public static boolean checkrows(String[][] board,int row,int col)
    {
        for(int r=0;r<row;r++)
        {
            HashSet<String> set=new HashSet<>();
            for(int c=0;c<col;c++)
            {
                if(board[r][c]== "" ) continue;
                if(set.contains(board[r][c])) return false;
                else set.add(board[r][c]);
            }
        }
        return true;
    }
    public static boolean checkcols(String[][] board,int row,int col)
    {
        for(int c=0;c<col;c++)
        {
            HashSet<String> set=new HashSet<>();
            for(int r=0;r<row;r++)
            {
                if(board[r][c]== "" ) continue;
                if(set.contains(board[r][c])) return false;
                else set.add(board[r][c]);
            }
        }
        return true;
    }
	public static void main(String[] args)
	{
		
	}

}
