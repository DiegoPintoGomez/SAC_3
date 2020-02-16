/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sac.Logic.Bancos;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 *
 * @author Chris
 */
public class Contacto {
    private List<Calendar> date;
    private String Nota;
    private String numero_Telefono;
    private String estado;
    private int encuesta;
    private int base;     
    private Calendar citaTelefonica;
    private boolean ListaGris;
    //estos son para la base de datos

    public Contacto() {
        this.date = new ArrayList<Calendar>();
        this.Nota = " ";
        this.numero_Telefono ="";
        this.estado = "Sin Realizar";
        this.encuesta = 0;
        this.base = 0;
        this.citaTelefonica = new GregorianCalendar();
        this.ListaGris = false;
    }    
    
    public int getEncuesta() {    
        return encuesta;
    }

    //
    public boolean isListaGris() {
        return ListaGris;
    }

    public void setEncuesta(int encuesta) {
        this.encuesta = encuesta;
    }

    public void setListaGris(boolean ListaGris) {
        this.ListaGris = ListaGris;
    }

    public void setDate(List<Calendar> date) {
        this.date = date;
    }

    public void setNota(String Nota) {
        this.Nota = Nota;
    }

    public List<Calendar> getDate() {
        return date;
    }

    public String getNota() {
        return Nota;
    }

    public Contacto(String numero_Telefono) {
        this.numero_Telefono = numero_Telefono;
        this.estado= "Sin Realizar";
        this.citaTelefonica= new GregorianCalendar();
        this.citaTelefonica.set(0, 0, 0);
        this.date = new ArrayList<Calendar>();
        int base=0;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Calendar getCitaTelefonica() {
        return citaTelefonica;
    }

    public void setCitaTelefonica(Calendar citaTelefonica) {
        this.citaTelefonica = citaTelefonica;
    }
    
   
   
    public String getNumero_Telefono() {
        return numero_Telefono;
    }

    public void setNumero_Telefono(String numero_Telefono) {
        this.numero_Telefono = numero_Telefono;
    }
    
    @Override
    public String toString() {
        return "Contacto{" + "numero_Telefono=" + numero_Telefono + "}\n";
    }

    public void setBase(int base) {
        this.base = base;
    }

    public int getBase() {
        return base;
    }
   
    
}
