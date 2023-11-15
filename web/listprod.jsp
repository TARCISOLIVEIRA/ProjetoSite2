<%-- 
    Document   : listprod
    Created on : 16 de set. de 2023, 14:02:04
    Author     : NevesRibeiro
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagens de Produtos</title>
        <link rel="stylesheet"  href="tabela.css">
    </head>
    <body>
        <%
                      
        try{
          Connection conecta;
          PreparedStatement st;
          Class.forName("com.mysql.cj.jdbc.Driver");
          conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco","root","root");
          st = conecta.prepareStatement("SELECT * FROM produto ORDER BY preco");
          ResultSet rs = st.executeQuery();
          
        %>

        
        <table>
            <tr>
                <th> Codigo</th>
                <th>Nome</th>
                <th>Marca</th>
                <th>Preco</th> 
                <th>Excluir</th>
                <th>Alteracao</th>
            </tr>
               

        <%
        while ( rs.next()) {
        %>


           <tr>
               <td><%= rs.getInt("codigo") %></td>
               <td><%= rs.getString("nome") %></td>
               <td><%= rs.getString("marca") %></td>
               <td><%= rs.getString("preco") %></td>
               <td><a href="excpro.jsp?codigo=<%=rs.getInt("codigo")%>">Excluir</a></td>
               <td><a href="carregaprod.jsp?codigo=<%=rs.getInt("codigo")%>">Alterar</a></td>

            </tr>


        <%
              
        }
          
        %>

        </table>
        
        <%
         

          } catch (Exception x) {
         out.print(x.getMessage()); 
             
          }
        
            
        %>
</body>
</html>
