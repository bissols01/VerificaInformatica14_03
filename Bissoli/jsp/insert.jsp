<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
    <style>
    h1{
        color:white;
        text-align:center;
        font-size:200%;
        font-family:impact;
        text-shadow: 2px 2px #000000;
        text-outline-color:black;
    }
    p{
        
        color:white;
        text-align:center;
        font-size:200%;
        font-family:impact;
        text-shadow: 2px 2px #000000;
        text-outline-color:black;
    }
    </style>

        <title>Creare un Cantante</title>
    </head>
    <body>
    

       <% 
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bissoli.marco;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			Statement stmt = connection.createStatement();

            String Nome = request.getParameter("Nome");
            String Cognome = request.getParameter("Cognome");
            String LuogoDiNascita = request.getParameter("LuogoDiNascita");
            String DataDiNascita = request.getParameter("DataDiNascita");
            
           
	        String sql = "INSERT INTO Cantante (Nome, Cognome, LuogoDiNascita, DataDiNascita) VALUES (?,?,?,?)";
			PreparedStatement ps1 = connection.prepareStatement(sql);
			
			ps1.setString(1, Nome);
			ps1.setString(2, Cognome);
			ps1.setString(3, LuogoDiNascita);
			ps1.setString(4, DataDiNascita);
			
			
						
			 ps1.executeUpdate();
			
     %> <form method="post" action="/html/home.html">
	            <h2 style="color:green; text-align:center;">Cantante CREATO!</h2>
	            
	            <p ><input type="submit" value="OK"/></p>
	            </form>
     <%
			
	        
	        
	        
	        connection.close();
        
        %>
    </body>
</html>