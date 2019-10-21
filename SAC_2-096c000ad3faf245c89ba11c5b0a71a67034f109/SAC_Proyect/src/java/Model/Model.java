/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Conection.DaoBanco;
import Conection.DaoContacto;
import Conection.DaoEncuesta;
import Conection.DaoOperadora;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sac.Logic.Bancos.Bancos_Telefonicos;
import sac.Logic.Bancos.Operadora;
import sac.Logic.Bancos.Random;
import sac.Logic.Encuesta.Encuesta;

/**
 *
 * @author Chris
 */
public class Model {

    private static Model uniqueInstance;

    public static Model instance() {
        if (uniqueInstance == null) {
            uniqueInstance = new Model();
        }
        return uniqueInstance;
    }

    public void insertarBanco(Bancos_Telefonicos BT, Encuesta Encu) throws SQLException {
        DaoBanco.insertBanco(BT, Encu);
    }

    public void insertarEncuesta(Encuesta Encu) throws SQLException {
        DaoEncuesta.insertEncuesta(Encu);
    }

    public void insertarMuestra(Encuesta encu) throws SQLException {
        DaoBanco.insertarLista(encu);
        DaoContacto.insertarContactosBancos(encu);
    }

    public void insertarOperadora(Operadora Ope) throws SQLException {
        DaoOperadora.insertOperadora(Ope);
    }

    public Encuesta getEncuesta(String Nom) {
        Encuesta encu = null;
        encu = DaoEncuesta.findByName(Nom);
        encu.setListaBancosTelefonicos((ArrayList<Bancos_Telefonicos>) DaoBanco.getAllBanco(Nom));
        return encu;
    }

    public void deleteAllEncuesta(Encuesta EX) {
        DaoContacto.deletenumero_emcuesta(EX);
        DaoBanco.deletebanco_encuesta(EX);
        DaoEncuesta.delete_encuesta(EX);
    }

    public void deleteOperadora(Operadora op) {
        DaoOperadora.deleteOperadora(op);
    }

    public List<Operadora> getAllOperadora() {
        return DaoOperadora.getAlloperadora();
    }

    public List<Encuesta> getAllEncuesta() {
        return DaoEncuesta.getListEncuesta();
    }

    public boolean encuestaExciste(String nom) {
        return DaoEncuesta.EncuestaExciste(nom);
    }

}
