/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sac.Logic.Bancos;

/**
 *
 * @author Chris
 */
public class Operadora {
    
    private int id;
    private String nombre; // Nombre Operadora : Ejemplo Kolbi
    private String rangoMenor; //rango inicial de numeros telefonicos
    private String rangoMayor; //rango inicial de numeros telefonicos
    

    public Operadora(String Nombre, String rangoMenor, String rangoMayor) {
        this.nombre = Nombre;
        this.rangoMenor = rangoMenor;
        this.rangoMayor = rangoMayor;
        this.id= 0;
        
    }

    public Operadora() {    
        this.nombre ="";
        this.rangoMenor = "";
        this.rangoMayor ="";  
         this.id= 0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String Nombre) {
        this.nombre = Nombre;
    }

    public String getRangoMenor() {
        return rangoMenor;
    }

    public void setRangoMenor(String rangoMenor) {
        this.rangoMenor = rangoMenor;
    }

    public String getRangoMayor() {
        return rangoMayor;
    }

    public void setRangoMayor(String rangoMayor) {
        this.rangoMayor = rangoMayor;
    }

    @Override
    public String toString() {
        return "Operadora{" + "Nombre=" + nombre + ", rangoMenor=" + rangoMenor + ", rangoMayor=" + rangoMayor + '}';
    }
    
    

    
}
