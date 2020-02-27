/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sac.Logic.Bancos;

import sac.Logic.Encuesta.Encuesta;
import java.util.ArrayList;
import java.util.Vector;

/**
 *
 * @author Chris
 */
public class Bancos_Telefonicos {
    
     private Vector<Contacto> listaContacos;  // Vector de Contactos Telefonicos
     private String nombreBanco; //El nombre del banco seria los 5 primeros numeros del Banco.
     private boolean estado;
     private String encu;
    //-------------------- 

    public String getEncu() {
        return encu;
    }

    public void setEncu(String encu) {
        this.encu = encu;
    }

     public Bancos_Telefonicos(String nombreBanco) {

       this.listaContacos = new Vector<Contacto>();

        this.nombreBanco = nombreBanco;
        
        this.estado= false;

    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
     
    public Bancos_Telefonicos(Vector<Contacto> listaContacos, String nombreBanco, int Id, boolean estado) {
        this.listaContacos = listaContacos;
        this.nombreBanco = nombreBanco;
        
        this.estado = estado;
    }
     
     public Bancos_Telefonicos( String nombreBanco, boolean estado) {
        this.listaContacos = new Vector<Contacto>();
        this.nombreBanco = nombreBanco;
       
        this.estado = estado;
    }
   

    public boolean isEstado() {
        return estado;
    }
        
    public Bancos_Telefonicos() {
        this.listaContacos = new Vector<Contacto>();
        this.nombreBanco= "";
    
        this.estado=false;
    }

    public String getNombreBanco() {
        return nombreBanco;
    }

    public void setNombreBanco(String nombreBanco) {
        this.nombreBanco = nombreBanco;
    }

    public Vector<Contacto> getListaContacos() {
        return listaContacos;
    }

    public void setListaContacos(Vector<Contacto> listaContacos) {
        this.listaContacos = listaContacos;
    }

    @Override
    public String toString() {
        return "Bancos_Telefonicos{" + "listaContacos=" + listaContacos + ", nombreBanco=" + nombreBanco + "\n";
    }

    public String getBase() {
        return this.nombreBanco;
    }
    
}
