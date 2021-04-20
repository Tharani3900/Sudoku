package Sudokugsv;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class sudokucontroller
 */
@WebServlet("/sudokucontroller")
public class sudokucontroller extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sudokucontroller()
    {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String command=(String)request.getParameter("command");
		switch(command)
		{
			case "generate":
			{
				generatesudokuboard(request,response);
				break;
			}
			case "checkanswer":
			{
				checksudokuboard(request,response);
				break;
			}
			case "solve":
				solvesudoku(request,response);
				break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}
	
	protected void generatesudokuboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int k=1;
		k= Integer.parseInt(request.getParameter("known"));
		new sudokugenerator(9,k);
		String[][] question=new String[9][9];
		String[][] solution=new String[9][9];
		try 
		{
			solution=sudokugenerator.getsolution();
		}
		catch(Exception e) {}
		try 
		{
			question=sudokugenerator.getgeneratedboard();
		}
		catch(Exception e) {}
		request.getSession().setAttribute("solution", solution);
		request.getSession().setAttribute("mat", question);
		response.sendRedirect("Home.jsp");	
	}
	
	protected void checksudokuboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String answer[][]=new String[9][9];
		int k=1;
		for(int i=0;i<9;i++)
			for(int j=0;j<9;j++)
			{
				
				answer[i][j]=request.getParameter(String.valueOf(k));
				k++;
			}
		if( sudokuvalidator.isValidSudoku(answer) )
		{
			response.sendRedirect("Home.jsp?status=correct");
		}
		else 
			response.sendRedirect("Home.jsp?status=wrong");
	}
	
	protected void solvesudoku(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String board[][]=new String[9][9];
		String k="";
		for(int i=0;i<9;i++)
		{
			for(int j=0;j<9;j++)
			{
				k="1"+i+""+j;
				if( request.getParameter(k)!=null && request.getParameter(k).length()>0 )
					board[i][j]=request.getParameter(k).trim();
				else 
					board[i][j]="";
			}
		}
		if( sudokuvalidator.isValidSudoku(board) )
		{
			request.getSession().setAttribute("mat1", board);
			new sudokusolver(board);
			String[][] solution=sudokusolver.getsolvedboard();
			request.getSession().setAttribute("solvedboardsolution", solution);
			response.sendRedirect("Home.jsp?solve=success");
		}
		else 
		{
			request.getSession().setAttribute("mat1", board);
			response.sendRedirect("Home.jsp?solve=wrong");
		}
	}
}
