
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>


<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Alteração de produtos</title>
    </head>
    <body>
        
        <%
          // receber codigo  
          int c;
          c = Integer.parseInt(request.getParameter("codigo"));
            
          // conectar
            
          Connection conecta;
          PreparedStatement st;
          Class.forName("com.mysql.cj.jdbc.Driver");
          conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco","root","root");
            
          // Busca o produto
          
          st = conecta.prepareStatement("Select * from produto where codigo = ?");
          
          st.setInt(1,c);
          st.executeQuery();  // executa
          
          ResultSet resultado = st.executeQuery();
          if (!resultado.next()){
              out.print("Não foi encontrado");
          } else {
              
           %>
           
           <form method="post" action="alterar_produtos.jsp">
            
            
            <p>
                <label for="codigo">Codigo :</label>
                <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("codigo")  %>" readonly  > 
            </p>
            
            <p>
                <label for="nome"  >Nome do Produto :</label >
                <input type="text" name="nome" id="nome" size="50" maxlength="50"  value="<%= resultado.getString("nome") %>" >
                
            </p>
            
            
            <p>
                <label for="marca"> Marca do Produto :</label >
                <input type="text" name="marca" id="marca" maxlength="50"  value="<%= resultado.getString("marca") %>"  >
                
            </p>
            
            <p>
                <label for="preco"> Preço do Produto :</label >
                <input type="number" step="0.1" name="preco" id="preco"   value="<%= resultado.getString("preco") %>" >
                
            </p>
            
            <p>
                <input type="submit" value="Salvar Alterações">
            </p>
        </form>
           
           
           
              
              
              
           <%   
             
          }
            
           %>
        
        
        
        
    </body>
</html>
