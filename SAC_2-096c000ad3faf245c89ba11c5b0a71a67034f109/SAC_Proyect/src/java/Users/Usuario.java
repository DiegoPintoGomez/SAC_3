package Users;
// Generated 30/10/2018 04:12:49 AM by Hibernate Tools 4.3.1

import java.util.ArrayList;
import sac.Logic.Bancos.Bancos_Telefonicos;




/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private String id;
     private String pass;
     private ArrayList<Bancos_Telefonicos> BancosUsuario;
     

    public Usuario() {
        id="";
        BancosUsuario= new ArrayList();
        pass="";
    }

    public Usuario(String id, ArrayList<Bancos_Telefonicos> BU, String pass) {
       this.id = id;
       this.BancosUsuario = BU;
       this.pass = pass;
    }
   
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public ArrayList<Bancos_Telefonicos> getLabor() {
        return this.BancosUsuario;
    }
    
    public void setLabor(ArrayList<Bancos_Telefonicos> BU) {
        this.BancosUsuario = BU;
    }
    public String getPass() {
        return this.pass;
    }
    
    public void setPass(String pass) {
        this.pass = pass;
    }

}


