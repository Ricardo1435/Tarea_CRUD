/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {
    PreparedStatement ps;
    ResultSet rs;
    ConexionDB c = new ConexionDB();
    Connection con;
    
    public List listar(){
        List <Producto>lista = new ArrayList<>();
        String sql="SELECT id_producto, nombre, existencia, precio, fecha_caducidad, descripcion_marca, descripcion_categoria FROM supermercado.producto, supermercado.marca, supermercado.categoria WHERE producto.id_marca=marca.id_marca AND producto.id_categoria=categoria.id_categoria";
        try {
            con=c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Producto p = new Producto();
                p.setID(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setExistencia(rs.getString(3));
                p.setPrecio(rs.getString(4));
                p.setCaducidad(rs.getString(5));
                p.setMarca(rs.getString(6));
                p.setCategoria(rs.getString(7));
                lista.add(p);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    public int agregar(Producto p){
        int r=0;
     String sql="INSERT INTO supermercado.producto(id_producto, nombre, existencia, precio, fecha_caducidad, id_marca, id_categoria) VALUES (?,?,?,?,?,?,?)";
        try {
            con=c.conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, p.getID());
            ps.setString(2, p.getNombre());
            ps.setString(3, p.getExistencia());
            ps.setString(4, p.getPrecio());
            ps.setString(5, p.getCaducidad());
            ps.setString(6, p.getMarca());
            ps.setString(7, p.getCategoria());
            r=ps.executeUpdate();
            if(r==1){
                r=1;
            }else{
                r=0;
            }
        } catch (Exception e) {
        }
        return r;
    }
    
    public Producto listarID(String id){
        Producto p = new Producto();
        String sql= ("SELECT * FROM supermercado.producto WHERE id_producto= "+id);
        try {
            con=c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                p.setID(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setExistencia(rs.getString(3));
                p.setPrecio(rs.getString(4));
                p.setCaducidad(rs.getString(5));
                p.setMarca(rs.getString(6));
                p.setCategoria(rs.getString(7));
            }
        } catch (Exception e) {
        }
        return p;
    }
    
    public int actualizar(Producto p){
        int r=0;
        String sql="update supermercado.producto set nombre=?, existencia=?, precio=?, fecha_caducidad=?, id_marca=?, id_categoria=? WHERE id_producto=?";
        try {
            con=c.conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getExistencia());
            ps.setString(3, p.getPrecio());
            ps.setString(4, p.getCaducidad());
            ps.setString(5, p.getMarca());
            ps.setString(6, p.getCategoria());
            ps.setString(7, p.getID());
            r=ps.executeUpdate();
            if(r==1){
                r=1;
            }else{
                r=0;
            }
        } catch (Exception e) {
        }
        return r;
    }
    public void eliminar(String id){
        String sql="DELETE FROM supermercado.producto WHERE id_producto="+id;
        try {
            con=c.conectar();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public List buscar(String texto){
        List <Producto> lista = new ArrayList<>();
        String sql="SELECT * FROM supermercado.producto, supermercado.marca, supermercado.categoria WHERE producto.id_marca=marca.id_marca AND producto.id_categoria=categoria.id_categoria AND producto.nombre LIKE '%"+texto+"%'";
        try {
            con=c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Producto pr = new Producto();
                pr.setID(rs.getString("id_producto"));
                pr.setNombre(rs.getString("nombre"));
                pr.setMarca(rs.getString("descripcion_marca"));
                pr.setCategoria(rs.getString("descripcion_categoria"));
                pr.setExistencia(rs.getString("existencia"));
                pr.setPrecio(rs.getString("precio"));
                pr.setCaducidad(rs.getString("fecha_caducidad"));
                lista.add(pr);
            }
        } catch (Exception e) {
        }
        return lista;
    }
}
