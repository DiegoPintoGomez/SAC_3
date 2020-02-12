/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sac.Logic.Bancos;

//import Sac.Conection.DaoBanco;
import sac.Logic.Bancos.Contacto;
import sac.Logic.Bancos.Bancos_Telefonicos;
import sac.Logic.Encuesta.Encuesta;

import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author Chris
 */
public class Random { 

    private ArrayList<Operadora> ListaOperadoras; // Guarda Operadoras Existentes, EJMEPLO> Kolbi, Movistar

    public Random() {

        this.ListaOperadoras = new ArrayList<Operadora>();
    }

    public ArrayList<Operadora> getListaOperadoras() {
        return ListaOperadoras;
    }

    public void setListaOperadoras(ArrayList<Operadora> ListaOperadoras) {
        this.ListaOperadoras = ListaOperadoras;
    }
    
    
    //Retorna la cantidad de numeros disponibles en el universo celular
    // Suma el valor de los rangos de cada Operadora que se encuentre en la ListaOperadoras
    public int UniversoCelular() {
        int cantidadNumerosTelefonicos = 0;// variable que guarda valor a retornar
        int rangoMayor = 0;// guarda valor Rango de cada operadora para realizar operacion
        int rangoMenor = 0;

        for (Operadora o1 : this.ListaOperadoras) { // recorre la lista de operadoras
            rangoMayor = Integer.parseInt(o1.getRangoMayor());// convierte rangos de strin a int para realixar operaciones
            rangoMenor = Integer.parseInt(o1.getRangoMenor());
            cantidadNumerosTelefonicos += (rangoMayor - rangoMenor) + 1; // El rango Mayor-Menor y se le suma uno para completar cifra y da la cantidad Total de 
                                                                         // numeros disponibles para cada operadora y se van sumando en la variable  cantidadNumerosTelefonicos

            System.out.println(cantidadNumerosTelefonicos);
        }

        return cantidadNumerosTelefonicos * 1000; // retornar variable y *1000 para completar ceros

    }
    
    
    //Recibe una operadora y calcula su cantidad de numeros en total disponibles, la proporcion de esa cantidad segun el universo Telefonico total
    // y segun el tamano de muestra, define cuantos bancos corresponde por cada operadora.
    public int calculaBancosPorOperadora(int tamanoMuestra, Operadora o1) {

        int universoTelefonico = UniversoCelular();// Total de numeros entre todas las Operadoras
        float proporcion = 0; // Prorcion de la operadora en Universo telefonico ( NumerosdeTelefonoPorOperadora / TotalDeNumerosEntreTodasLasOperadoras))
        int numerosPorOperadoraDisponibles = 0; // Va a guardar el valor de NumerosdeTelefonoPorOperadora 
        float auxBancosPorOperadora = 0; //Float comodin para guardar datos
        int bancosPorOperadora = 0;// Guarda el resultado a encontrar y retornar
        int rangoMayor = 0;// Guarda rango Mayor Operadora
        int rangoMenor = 0;// Guarda rango menor Operadora

        rangoMayor = Integer.parseInt(o1.getRangoMayor()); // convierte el rango en int, para realizar calculos
        rangoMenor = Integer.parseInt(o1.getRangoMenor()); // convierte el rango en int, para realizar calculos
        numerosPorOperadoraDisponibles = ((rangoMayor - rangoMenor) + 1) * 1000; // Calcula cuantos numeros tiene la operadora en total
        // suma uno para cerrar cifra y *1000 para cpmpletar ceros restantes
        //multiplica por 1000 para completar ceros restantes.
        
       
        proporcion = (float) numerosPorOperadoraDisponibles / (float) universoTelefonico;  // Proporcion de la Operadora, float para guardar decimales
        auxBancosPorOperadora = proporcion * (float) tamanoMuestra;  // se castea la muestra float para poder utiilzar decimales de Proprcion
        bancosPorOperadora = Math.round(auxBancosPorOperadora); // Convierte float a int redondondeando la cifra Ejemplo> 224.3 =224

        System.out.println("Pruebas en consola");
        System.out.println("Universo Celular:" + universoTelefonico);
        System.out.println("Operadora: " + o1.getNombre());
        System.out.println("Proporcion: " + proporcion);

        System.out.println("Universo Celular:" + universoTelefonico + "\n" + "numeros por Operadora Disponibles: " + numerosPorOperadoraDisponibles + "\n" + "Cantidad de Bancos:" + bancosPorOperadora);

        return bancosPorOperadora; // retorna la cantidad de Bancos para esa operadora

    }

    
    
   
    
    // Este metodo genera una Lista de  numeros aleatorios
    // Funciona para Generar los Primeros 5 numeros del banco o los 3 restantes
    // No permite numeros Aleatorios Repetidos 
    // Datos de entrada 
    // Cantidad: Cantidad de Numeros Aleatorios se desean generar
    // min: Rango minimo del numero Aleatorio
    // max: Rango maximo del numero Aleatorio
    public ArrayList aleatorio(int cantidad, int min, int max) {
        System.out.println("generando rango aleatorio");

        int numeroAleatorio;// numero Aleatorio que se va a crear
        ArrayList<Integer> ListaNumerosAleatorios = new ArrayList<>(); // Lista en donde se guardan los numeros Aleatorios
        int contador = 0;                                                             // Se retorna al final
        int range = max - min + 1;
        while (contador < cantidad) {      // se detiene cuando se crean la cantidad de numeros indicados por el usuario

            numeroAleatorio = (int) (Math.random() * range) + min; // Formula que genera un numero Aleatorio en un rango especifico

            if (ListaNumerosAleatorios.contains(numeroAleatorio)) { // Si el numero exite en la lista (numero repetido)
                //no deja avanzar al contador, para que genere un nuevo numero, no repetido
                contador--;

            } else {
                ListaNumerosAleatorios.add(numeroAleatorio);// SI no esta repetido, lo agrega a la lista
                contador++;
            }

        }

        System.out.println(ListaNumerosAleatorios.toString()); // ToString para Pruebas
        return ListaNumerosAleatorios; // Retorna la Lista
    }

    
    
    
    
    
    //Este metodo toma la lista de bancos telefonicos(5 primeros numeros) creada en Aleatorio  y genera los numeros correspondientes por banco
    // para cada banco telefonico, crea un contacto para cada numero generado, crea un banco y se agregan en ;la lista de contactos 
    // del banco, posteeriormente, agrega cada banco en una lista.
    // El ciclo for recorre la lista de bancos lista_5_NumerosDelBanco, y while genera n cantidad de numeros para el banco numerico seleccionado en el momento.
    // Ejemplo: lista_5_NumerosDelBanco:[55555, 33333,...n]
    // Resultado del metodo: LISTABANCOS: [55555123,55555897,555000..n]->[33333123,33333897,33333000..n]->n
    public ArrayList<Bancos_Telefonicos> generaBancosTeleFonicos(ArrayList<Integer> lista_5_NumerosDelBanco, int cantidad) {

        System.out.println("Creando lista de Bancos completa");
        ArrayList<Bancos_Telefonicos> ListaBancos = new ArrayList<>(); //Esta Lista guarda los bancos Telefonicos que se van a crear
        int contador = 0;                                               //contador del ciclo While

        // Recorre la lista que llega por Parametros
        for (int numbanco : lista_5_NumerosDelBanco) {
            Bancos_Telefonicos newBanco = new Bancos_Telefonicos(Integer.toString(numbanco)); // Variable comodin para crear un nuevo Banco
            // El nombre del banco, son los 5 numerosInciales
            //numbanco

            int numBanco_8digitos = (numbanco * 1000); // convirte el numero de banco de 5 digitos a 8
            // Ejemplo: 12345 =->12345000,

            contador = 0;   // reinicia contador cada vez que aumenta el ciclo del for
            ArrayList<Integer> Listxxx = aleatorio(cantidad, 0, 999); // crea Lista de los 3 numeros restantes de manera Aleaoria

            while (contador < cantidad) {

                int numeroTelefonico = numBanco_8digitos + Listxxx.get(contador); // se crea el numero telefonico final
                //suma del banco (5 inicial*1000 )+ 3 restantes
                // Ejemplo: 12345000+789=12345789

                Contacto newContacto = new Contacto(Integer.toString(numeroTelefonico)); // crea un contacto con el numero de telefono generado
                //Se convierte el numero de int a String

                newBanco.getListaContacos().add(newContacto); // Se agrega el contacto creado(newContacto) a ListaContacto(Vector de Contactos) del Banco
                //EJEMPLO:  BancoTelonico --> nombre: 12345,  ListaContacto: [ 12345452,12345000,..]
                contador++; //aumenta contador del while

            } ////sale del While
            /// Continua siguiente numero de  Banco de La lista(5 digitos), para generar sus 3 numeros restantes.           
//            System.out.print("Lista FInal de Banco-->");// SOlo pruebas

            ListaBancos.add(newBanco);// Guarda los Bancos, con sus respectivos 10 Contactos (Se guradan en un vector)
            // En este momento es cuando se  agregan los bancos en la encuesta.
            // Encuesta tiene de ListaBancos, la variable   ArrayList<Bancos_Telefonicos> ListaBancos esta cumpliendo
            //La funcion de Lista de la Encuesta.
        } //Termina el ciclo

        Collections.shuffle(ListaBancos); //Shuffle para desordenar La lista de Bancos Finalmente
        //Evita que el orden de las operaddoras esten aleatorias.

        return ListaBancos;

    }





// Este metodo Crea la Lista de Bancos, recibde la cantidad de bancos a generar
    // Toma la lista de operadoras, calcula la cantidad de bancos por operadora gracias al metodo calculaBancosPorOperadora()
    // Agrega los bancos a la Encuesta, aqui se generaria la lista de Bancos Telefonicos completa  de la Encuesta.
    public void GeneraListaBancos(Encuesta encuesta, int telefonosPorBanco) {

        int cantidadBancosTotales = encuesta.getMuestra() / telefonosPorBanco;  // Muestra / telefonosporBanco= Cantidad de Banos totales a generar

        ArrayList<Integer> ListaBancoInicial = new ArrayList<>(); // Lista Auxiliar para mover Datos
        int rangoMenor; // toma el rango menor de la operadora
        int rangoMayor; // toma el rango mayor de la operadora

        for (Operadora operadora : this.ListaOperadoras) { // recorre lista de operadoras

            int cantidadBancosparaCrear = this.calculaBancosPorOperadora(cantidadBancosTotales, operadora); //Retorna el numero la cantidad de bancos por Operado hay que generar
            rangoMayor = Integer.parseInt(operadora.getRangoMayor()); //Guarda dato Rango Mayor
            rangoMenor = Integer.parseInt(operadora.getRangoMenor()); //Guarda dato Rango Mayor
            ListaBancoInicial = this.aleatorio(cantidadBancosparaCrear, rangoMenor, rangoMayor); //Se genera Lista con los 5 nueros inciales del Banco a crear
            ArrayList<Bancos_Telefonicos> ll = this.generaBancosTeleFonicos(ListaBancoInicial, telefonosPorBanco);
            encuesta.getListaBancosTelefonicos().addAll(this.generaBancosTeleFonicos(ListaBancoInicial, telefonosPorBanco)); // Se Crean los bancos y se guardan en la Encuesta, Generando a cada banco de 5 Numeros
            // los 3 numeros restantes, segun la cantidad de numeros por Banco 
            // deseada. En este caso 10, puede variar segu desea el usuario
           

        }

        System.out.println("---------Tamano de la Lista  " + encuesta.getListaBancosTelefonicos().size() + "  ---------------------"); //Muestro Datos, solo para pruebas

        for (Bancos_Telefonicos b : encuesta.getListaBancosTelefonicos()) {
            System.out.println("Nombre: " + b.getNombreBanco());
//        System.out.println( b.getListaContacos().toString());  
        }

    }    
    
    

}



