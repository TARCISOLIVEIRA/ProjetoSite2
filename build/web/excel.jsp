
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Via Excel</title>
    </head>
    <body>
        <%
            
         try{  
             
             String sql="";
             PreparedStatement st;
             
             
          //Conectar ao banco de dados  
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco","root","root");
        
        //Ler arquivos do excel
        FileReader arquivo = new FileReader("C:\\site\\produtos.csv");
        BufferedReader br = new BufferedReader(arquivo);
        
        String linha;
        // Se a linha lida do arquivo produtos não estiver nula vai carregar.
        while( (linha = br.readLine()) != null){
            String[] dados = linha.split(",");
            String cod = dados[0].replaceAll("[^0-9]","");
            int c = Integer.parseInt(cod);
            
            
       
            String n = dados[1];
            String m = dados[2];
            double p = Double.parseDouble(dados[3]);
            
            sql = "select * from produto where codigo = ?";
            st = conecta.prepareStatement(sql);
            st.setInt(1,c);
            
            ResultSet Resultado = st.executeQuery();
            
            if(!Resultado.next()){
            
            
            sql = "Insert into produto values (?,?,?,?)";
            st = conecta.prepareStatement(sql);
            st.setInt(1,c);
            st.setString(2,n);
            st.setString(3,m);
            st.setDouble(4,p);
            
            st.executeUpdate();
            out.print("O produto" + c + " já com sucesso");
            }else {
                    out.print("produto cadastrado");    
                         }
        }
        br.close();
        
         } catch (Exception erro) {
             out.print("Entre em contato informe o erro" + erro.getMessage());
                 
                 }
        
            
            
        %>
        
    </body>
</html>
