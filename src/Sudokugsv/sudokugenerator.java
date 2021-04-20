package Sudokugsv;

import java.util.Random;

public class sudokugenerator
{
	static String[][] board; 
	int n ; // number of columns/rows. 
	int sqrt; // square root of N 
	int k; // No. Of missing digits 
	static String unfilled[][];
	// Constructor 
	sudokugenerator(int N, int K) 
	{ 
		this.n = N; 
		this.k = K; 
	
		// Compute square root of N 
		Double SRNd = Math.sqrt(N); 
        sqrt = SRNd.intValue();
		unfilled=new String[n][n];
		board = new String[n][n]; 
		for(int i=0;i<9;i++)
		{
			for(int j=0;j<9;j++)
				board[i][j]="0";
		}
		Generatesudoku(); 
	} 

	// Sudoku Generator 
	public void Generatesudoku() 
	{ 
		// Fill the diagonal of SRN x SRN matrices 
		fillDiagonal(); 

		// Fill remaining blocks 
		fillremaining(0, sqrt); 
		
		makeacopy();
	
		// Remove Randomly K digits to make game 
		removeKDigits(); 
		
	} 
	void makeacopy()
	{
		for(int i=0;i<9;i++)
			for(int j=0;j<9;j++)
			 	unfilled[i][j]=board[i][j];
	}
	// Fill the diagonal SRN number of SRN x SRN matrices 
	void fillDiagonal() 
	{ 
		Random rn = new Random();
		for (int grid = 0; grid<n; grid=grid+sqrt) 
		{
			String num; 
			for (int row=0; row<sqrt; row++) 
			{ 
				for (int col=0; col<sqrt; col++) 
				{ 
					do
					{ 
						num = String.valueOf( rn.nextInt(9)+1 );
					} 
					while ( unUsedInBox(grid, grid, num) == false ); 
					System.out.print("dia"+num);
					board[row+grid][col+grid] = num; 
					System.out.println("assigned"+board[row+grid][col+grid]);
				} 
			} 
		}		
	} 
	public static String[][] getsolution()
	{
		return board;
	}
	public static String[][] getgeneratedboard()
	{
		return unfilled;
	}
	// Returns false if given 3 x 3 block contains num. 
	boolean unUsedInBox(int rowStart, int colStart, String num) 
	{ 
		for (int i = 0; i<sqrt; i++) 
		{
			for (int j = 0; j<sqrt; j++) 
			{
				if ( board[rowStart+i][colStart+j].equals(num) ) 
				{
					return false;
				}
			}
		}
		return true;
	} 


	// Check if safe to put in cell 
	boolean CheckIfSafe(int i,int j,String num) 
	{ 
		return ( unUsedInRow(i, num) && unUsedInCol(j, num) && unUsedInBox(i-i%sqrt, j-j%sqrt, num) ); 
	} 

	// check in the row for existence 
	boolean unUsedInRow(int i,String num) 
	{ 
		int j;
		for ( j = 0; j<n; j++) 
		{
			if (board[i][j].equals(num))
			{		
					return false; 
			}	
		}
		return true; 
	} 

	// check in the row for existence 
	boolean unUsedInCol(int j,String num) 
	{ 
		for (int i = 0; i<n; i++) 
		{
			if (board[i][j].equals(num))
			{
				return false; 
			}
		}
		System.out.print("col"+"true"+" "+num);
		return true; 
	} 

	// A recursive function to fill remaining 
	// matrix 
	boolean fillremaining(int row, int col) 
	{ 
		// System.out.println(i+" "+j); 
		if (col>=n && row<n-1) 
		{ 
			row = row + 1; 
			col = 0; 
		} 
		if (row>=n && col>=n) 
			return true; 

		if (row < sqrt) 
		{ 
			if (col < sqrt) 
				col = sqrt; 
		} 
		else if (row < n-sqrt) 
		{ 
			if (col==(int)(row/sqrt)*sqrt) 
				col = col + sqrt; 
		} 
		else
		{ 
			if (col == n-sqrt) 
			{ 
				row = row + 1; 
				col = 0; 
				if (row>=n) 
					return true; 
			} 
		} 

		for (int num = 1; num<=9; num++) 
		{ 
			String value=String.valueOf(num);
			if ( CheckIfSafe(row, col, value) ) 
			{ 
				board[row][col] = value; 
				if (fillremaining(row, col+1)) 
				{
					return true; 
				}
				board[row][col] = ""; 
			} 
		} 
		return false; 
	} 

	// Remove the K no. of digits to 
	// complete game 
	public void removeKDigits() 
	{ 
		while(k>0)
		{
			int rowid= ((int) (Math.random()*(n)+1)) -1;
			int colid= ((int) (Math.random()*(n)+1)) -1;
			if( unfilled[rowid][colid] != "")
			{
				unfilled[rowid][colid]="";
				k--;
			}
		}
	} 

	public static void main(String[] args)
	{
	

	}

}
