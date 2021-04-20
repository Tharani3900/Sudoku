package Sudokugsv;

public class sudokusolver
{
	static String[][] board;
	static int n;
	static int sqrt;
	static String[][] solvedboard;
	sudokusolver(String[][] board)
	{
		sudokusolver.board=board;
		solvedboard=board.clone();
		n=board.length;
		sqrt = (int)Math.sqrt(n);
		solver();
	}
	public static String[][] getboard()
	{
		return board;
	}
	public static String[][] getsolvedboard()
	{
		return solvedboard;
	}
	public static boolean solver()
	{
		//initializing row and column as -1;
		int row=-1;
		int col=-1;
		boolean ismissing=false;
		for(int i=0;i<n;i++)
		{
			for(int j=0;j<n;j++)
			{
				// checking if there is any missing element
				if(solvedboard[i][j].equals("")) 
				{
					//get the element position(row and column)
					row=i;
					col=j;
					//we still have some missing element
					ismissing=true;
					break;
				}
			}
			if(ismissing==true)
				break;
		}
		// return if there is no missing element
		if(ismissing==false)
			return true;
		// assign value from 1 to 9 
		for(char num='1';num<='9';num++)
		{
			//check if the assigned value is correct
			String value=String.valueOf(num);
			if( issafe(row,col,value) )
			{
				solvedboard[row][col]=value;
				//go to next element
				if( solver() )
					return true;
				else 
					//replace old value
					solvedboard[row][col]="";
			}
		}
		//return false if no solution is found
		return false;
	}
	
	public static boolean issafe(int row,int col,String value)
	{
		//check rows
		for(int i=0;i<n;i++)
			if( solvedboard[row][i].equals(value) )
				return false;
		
		//check columns
		for(int i=0;i<n;i++)
			if( solvedboard[i][col].equals(value) )
				return false;
		
		//check grid box
		 int sqrt = (int)Math.sqrt(solvedboard.length); 
	        int boxRowStart = row - row % sqrt; 
	        int boxColStart = col - col % sqrt; 
	  
	        for (int r = boxRowStart; 
	             r < boxRowStart + sqrt; r++)
	        { 
	            for (int d = boxColStart; 
	                 d < boxColStart + sqrt; d++)
	            { 
	                if (solvedboard[r][d].equals(value)) 
	                { 
	                    return false; 
	                } 
	            }
	        }
	      return true;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
