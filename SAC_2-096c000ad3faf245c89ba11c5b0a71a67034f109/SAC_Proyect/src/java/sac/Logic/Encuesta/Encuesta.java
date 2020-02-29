/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sac.Logic.Encuesta;

import sac.Logic.Bancos.Bancos_Telefonicos;
import java.util.ArrayList;

/**
 *
 * @author Chris
 */
public class Encuesta {
    
    private String nombreEncuesta;
    private  ArrayList<Bancos_Telefonicos> ListaBancosTelefonicos= new ArrayList<>();
    private int muestra;
    private int id;
    private boolean activo;

    public String getNombreEncuesta() {
        return nombreEncuesta;
    }

    public ArrayList<Bancos_Telefonicos> getListaBancosTelefonicos() {
        return ListaBancosTelefonicos;
    }

    public int getMuestra() {
        return muestra;
    }

    public int getId() {
        return id;
    }

    public boolean getActivo() {
        return activo;
    }

    public void setNombreEncuesta(String nombreEncuesta) {
        this.nombreEncuesta = nombreEncuesta;
    }

    public void setListaBancosTelefonicos(ArrayList<Bancos_Telefonicos> ListaBancosTelefonicos) {
        this.ListaBancosTelefonicos = ListaBancosTelefonicos;
    }

    public void setMuestra(int muestra) {
        this.muestra = muestra;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public Encuesta(String nombreEncuesta, int muestra) {
        this.nombreEncuesta = nombreEncuesta;
        this.muestra = muestra;
    }

    public Encuesta(String nombreEncuesta, int muestra, int id, boolean activo) {
        this.nombreEncuesta = nombreEncuesta;
        this.muestra = muestra;
        this.id = id;
        this.activo = activo;
    }

    public Encuesta() {
    }

 
  
}
