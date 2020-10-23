package Modelo;

import java.sql.*;

public class ConexionDB {
    Connection con;
    
   public Connection conectar(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/supermercado?user=root&password=1234");
            System.out.println("Conectado a MYSQL");
        }catch(Exception e){
            System.out.println("Error: "+e);
        } 
        return con;
    }
    
    
}
