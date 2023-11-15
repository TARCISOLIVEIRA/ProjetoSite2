
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Produtos</title>
    </head>
    <body>
        <%
            
          int c;
          String n, m;
          double p;
          // Receber os dados digitados
          c = Integer.parseInt(request.getParameter("codigo"));
          n = request.getParameter("nome");
          m = request.getParameter("marca");
          p = Double.parseDouble(request.getParameter("preco"));
            
          Connection conecta;
          PreparedStatement st;
          Class.forName("com.mysql.cj.jdbc.Driver");
          conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco","root","root");
  
          // ALTERAR 
            
          st = conecta.prepareStatement("Update produto set nome = ?, marca= ?, preco = ?  where codigo = ?");  
          
          st.setString(1,n);
          st.setString(2,m);
          st.setDouble(3,p);
          st.setInt(4,c);
          st.executeUpdate();
          out.print("Produto alterado ");

          %>  
        
        
        
        
        
    </body>
</html>
