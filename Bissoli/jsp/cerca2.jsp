<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    <div class="col-sm-8 text-left"> 
      <h1>Welcome</h1>
      <% 
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bissoli.marco;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			Statement stmt = connection.createStatement();

            String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            
            

			String sql = "SELECT Nome COUNT FROM Cantante where Nome = ? AND Cognome = ?";
			PreparedStatement ps1 = connection.prepareStatement(sql);
			ps1.setString(1, nome);
			ps1.setString(2, cognome);
			
			
			
			ResultSet rs = ps1.executeQuery();
			
			out.print("<table>");
			
			
			
    		while(rs.next()){
    		    
    		    
    		    
    		    String LuogoDiNascita = rs.getString("LuogoDiNascita");
				String DataDiNascita = rs.getString("DataDiNascita");
    		    String count = rs.getString("COUNT");
    		    if(rs.getString("Nome") != null){
                    String Nome = rs.getString("Nome");
                }else{
                    Nome = "";
                }
				
				if(rs.getString("Cognome") != null){
                    String Cognome = rs.getString("Cognome");
                }else{
                    Cognome = "";
                }
    		    if(count == null){
				    out.println("<p>Non ci sono cantanto che si chiamano:  "+Nome+"  "+Cognome+ "</p>");
				    
				}else{
				    
				    
				    
				    
				    
				   
    		    
                
				
				
				
                
                
                if (Nome != null){
                    out.println("" + Nome + "<br>");
                }
                
                if (Cognome != null){
                   
                   
                   
                    out.println("" + Cognome + "<br>");
                }
                
                if (LuogoDiNascita != null){
                    out.println("" + LuogoDiNascita + "<br>");
                }
                
                if (DataDiNascita != null){
                    out.println(""+ DataDiNascita + "<br>");
                }
                
                
                
                out.print("</tr>");

	        }
        }

	        
	        out.print("</table>");
	        
	        rs.close();
	        
	        connection.close();
        
        %>
    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>