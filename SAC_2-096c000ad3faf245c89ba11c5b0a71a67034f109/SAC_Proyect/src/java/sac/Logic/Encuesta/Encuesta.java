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

    public Encuesta(String nombreEncuesta, int muestra) {
        this.nombreEncuesta = nombreEncuesta;
        this.muestra = muestra;
        
    }

    public Encuesta() {
      ListaBancosTelefonicos= new ArrayList<>();
        this.muestra =0;
      this.nombreEncuesta = "";
   

    }

    public String getNombreEncuesta() {
        return nombreEncuesta;
    }

    public void setNombreEncuesta(String nombreEncuesta) {
        this.nombreEncuesta = nombreEncuesta;
    }



    public ArrayList<Bancos_Telefonicos> getListaBancosTelefonicos() {
        return ListaBancosTelefonicos;
    }

    public void setListaBancosTelefonicos(ArrayList<Bancos_Telefonicos> ListaBancosTelefonicos) {
        this.ListaBancosTelefonicos = ListaBancosTelefonicos;
    }

    public int getMuestra() {
        return muestra;
    }

    public void setMuestra(int muestra) {
        this.muestra = muestra;
    }

  
}
