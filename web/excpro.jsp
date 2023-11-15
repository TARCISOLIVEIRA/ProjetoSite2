<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Produtos</title>
    </head>
    <body>

        <%
          int cod;
          cod = Integer.parseInt(request.getParameter("codigo"));
          
          
          try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco","root","root");
          
          PreparedStatement st = conecta.prepareStatement("DELETE FROM produto WHERE codigo = ?");
          st.setInt(1,cod);
          
          int resultado = st.executeUpdate();
          
          
          if (resultado == 0){
              out.print("Este não produto não esta cadastrado");
          } else {
              out.print("O produto de código" + cod + " foi excluido com sucesso");
          }
          
          } catch (Exception erro){
               
              String mensagemErro = erro.getMessage();
              out.print("Entre em contato com suporte" + mensagemErro);
              
          }
          
        
        %>  


    </body>
</html>
