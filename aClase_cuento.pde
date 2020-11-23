class Cuento {

  PFont titulo, texto;
  int nroPagina, boton, tamText, alto;
  float boton1_x1=0,boton1_x2=0,boton1_y1=0,boton1_y2 =0;
  float boton2_x1=0,boton2_x2=0,boton2_y1=0,boton2_y2 =0;  
  int [][] historia = {  {1,1}, // P0 presentacion = (P1 estampida / P1 estampida)  (página en la que continúa)
                         {2,5}, // P1 estampida = (P2 inetntaSalvar / P5 ScarHuye) 
                         {3,4}, // P2 intetaSalvar = (P3 ReinoLuto / P4 ReinoScar)
                         {0,14}, // P3 ReinoLuto = (P0 presentacion / P14 creditos)
                         {0,14}, // P4 ReinoScar = (P0 presentacion / P14 creditos)
                         {6,9}, //  P5 ScarHuye = (P6 pelea / P9 SyM)
                         {7,8}, // P6 pelea = (P7 todoAntes / P8 ScarReino)
                         {0,14}, // P7 todoAntes = (P0 presentacion / P14 creditos)
                         {0,14}, // P8 ScarReino = (P0 presentacion / P14 creditos)
                         {10,11}, // P9 SyM = (P10 elefantes / P11 encuentra)
                         {0,14}, // P10 elefantes = (P0 presentacion / P14 creditos)
                         {12,12}, // P11 encuentra = (P12 scarVive / P13 ScarMuere)
                         {0,14}, // P12 scarVive = (P0 presentacion / P14 creditos)
                         {0,14}, //  P13 ScarMuere = (P0 presentacion / P14 creditos)
                         {0,0} // P14 creditos = (P0 presentacion / P0 presentacion)                     
                       };  
  PImage [] paginas = new PImage[historia.length]; //defino un arreglo donde cargo las páginas de la historia
  
  //arreglo con un texto explicativo de cada página
  String [] textosPantalla = {"En esta aventura gráfica podremos dar\n finales alternativos a la película a partir\n de la escena donde Simba queda atrapado\n en la estampida.\n\nApretá ENTER para comenzar",
                       "Por culpa de su tío Scar, Simba queda\natrapado en una estampida:",
                       "Mufasa, que llega ahí gracias a Zazú,\nlointenta salvar:",
                       "Luego de provocar la muerte del joven\npríncipe, Scar decide escapar y jamás\nvolver.",
                       "Scar se hace cargo del reino porque lo\nhace sentir culpable a Simba por la\nmuerte de su padre, haciéndolo huir.",
                       "Sorprendido, Scar huye:",
                       "Logra alcanzarlo y comienzan a pelear:",
                       "Mufasa vuelve al reino y todo continua\ncomo antes.",
                       "Scar se hace cargo del reino.",
                       "Simba le cuenta lo sucedido a su padre:",
                       "Luego de unos días, los elefantes encuentran a Scar y lo matan\ncon una estampida.",
                       "Luego de unos días buscando, lo\nencunetra:",
                       "Mufasa vuelve al reino y todo continúa\ncomo antes.",
                       "Mufasa perdió de vista a Scar y no lo logró alcanzar, pero\nnunca más se lo volvió a ver, por lo que la paz en el reino reapareció.",
                       ""};                       
   
  //arreglo con un texto explicativo de cada botón                     
  String [][] textoBoton = { {"", ""},
                       {"1. Simba llama a su\n padre por ayuda", "2. Simba logra salir\n sin ayuda y Scar huye"},
                       {"1. Lo lorga, pero Scar\n mata a Mufasa","2. No lo logra y el \nreino esta de luto \npor la muerte del \npríncipe"},
                       {"Volver","Créditos"},
                       {"Volver","Créditos"},
                       {"1. Mufasa, que estaba presente\n gracias a Zazú que le avisó,\n lo ve a Scar y lo comienza a\nperseguir","2. Scar logra escapar\nsin ser visto por nadie"},
                       {"1. Muere Scar","2. Muere Mufasa"},
                       {"Volver","Créditos"},
                       {"Volver","Créditos"},
                       {"1. Mufasa les pide ayuda a\nlos animales del reino\npara buscar a Scar","2. Mufasa decide ir a\nbuscarlo solo"},
                       {"Volver","Créditos"},
                       {"1. Mufasa lo deja \ncon vida a cambio de que\nScar se marche y\nnunca jamás vuelva al reino","2. Pelean hasta que\nMufasa mata a Scar"},
                       {"Volver","Créditos"},
                       {"Volver","Créditos"},
                       {"Comenzar de nuevo",""}                       
                         };   
                        
  Boton boton0;
  Boton boton1;
  int yrt,xrt; 
  boolean jugar; // determina si se juega al laberinto o se cuenta la historia
  Juego Laberito_mufasa;
  
//----------------------------------------------------------------------

  Cuento() {
  
    titulo = loadFont("Castellar-48.vlw");  //cargo las fuentes
    texto = loadFont("Arial-BoldItalicMT-48.vlw"); 
    tamText = 20;
    textSize(tamText);
    textAlign(CENTER, CENTER);  //alíneo el texto dentro del rectángulo
     
    for (int i=0; i<=14; i++) {  //cargo las imágenes en un arreglo con las páginas de la historia
       paginas[i] = loadImage("P"+(i)+".jpg"); 
    }
  
    nroPagina = 0; //página inicial de la historia
    jugar = false; // para activar el juego, solo cuando nroPagina=5
     
    textSize(tamText); 
    boton0 = new Boton (0,0,0, textoBoton[nroPagina][0], tamText); //creo el boton0   
    boton1 = new Boton (0,0,0, textoBoton[nroPagina][1], tamText); //creo el boton1    
  }

//---------------------------------------------------------------------- 
  void ContarCuento () {
    
    if (!jugar) {
      MostrarPagina(nroPagina);      
    }
    else {      
      switch (Laberito_mufasa.jugar()) {
        case 1: // juego terminó y ganó            
           CambiarPagina(6);
           jugar = false;
        break;
        case 2: // juego terminó y perdió           
           CambiarPagina(13);
           jugar = false;
        break;        
        // si vale 0 sigo jugando
      }
    }   
  }

//---------------------------------------------------------------------- 
  void MostrarPagina (int pagina) {

    float xrt, yrt;
    
    //definir coordenadas relativas de los rectángulos
    xrt = width/2;
    yrt = height/7;
    
    image(paginas[pagina], 0, 0, width, height);  //cargar fondo
    
    // imprimimos los textos de la pagina    
    if (textosPantalla [pagina] != "") {  //si la pantalla tiene textos
       // posicionar pantallas personalizadas: 0 y 13
       if (pagina == 13) {
         yrt = height/10;
       }
       else if (pagina == 0){
          yrt = height- 50 - (20+tamText*(contarLineas(textosPantalla[pagina])+1)+20)/2; 
          xrt = width - 250 - (20+textWidth(textoBoton[pagina][0])+20 ) /2;      
          fill(0);
          textFont(titulo, 50);
          text("El rey león", xrt, yrt-60);  
       }
       else {
         yrt = yrt + (20+tamText*(contarLineas(textosPantalla[pagina]))+20)/2; //le sumo medio cuadrado
       }
      
       // imprimimos los recuadros de los textos
       fill (0); //iniciamos a construir el rectángulo de fondo para los textos
       rectMode(CENTER);
       textAlign(CENTER);
        
       if (nroPagina != 0){ // la pagina 0 no lleva recuadros
         rect(xrt , yrt, 20+textWidth(textosPantalla[pagina])+20, 20 + tamText*(contarLineas(textosPantalla[pagina])) + 20, 15, 15, 15, 15);      
         strokeWeight(5);
         stroke(255);
         fill(255);
       }    
       textFont(texto, 20);
       text(textosPantalla[pagina], xrt, yrt);
    }
    //mostramos los botones
    boton0.mostrar_abajo_izquierda();
    boton1.mostrar_abajo_derecha();
  }  
  
//----------------------------------------------------------------------
  void teclado (){
    
    if (jugar) {
      Laberito_mufasa.keyPressed();
    }
    else if (keyCode == ENTER && nroPagina == 0) {
      CambiarPagina(historia[nroPagina][1]);         
    }   
  }

//----------------------------------------------------------------------    
  void botones () {

    if (jugar) {
      Laberito_mufasa.mousePressed();
    }
    else { //chequeo botones del laberinto
      if (boton0.clickeado()) { // si apreto botón 1 salto a la página correspondiente de la historia      
        CambiarPagina(historia[nroPagina][0]);
        if (nroPagina == 6 && !jugar) { // activamos el juego
          Laberito_mufasa = new Juego(12,18);
          jugar=true;          
        }
      }
      else if (boton1.clickeado()) { // si apreto botón 2, salto a la página correspondiente según la historia
        CambiarPagina(historia[nroPagina][1]);
      }                   
    }        
  }
//---------------------------------------------------------------------- 
  void CambiarPagina (int pagina) {
    nroPagina=pagina;
    boton0.actualizaBoton (0, 0, 100, textoBoton[nroPagina][0], tamText); //actualizamos datos del boton0    
    boton1.actualizaBoton (0, 0, 100, textoBoton[nroPagina][1], tamText); //actualizamos datos del boton1    
  }
  
//----------------------------------------------------------------------    
  //función para calcular la cantidad de línes que ocupa un string
  int contarLineas (String cadena) {
    
    int posicion, contador = 0;
    // busca la primera vez que aparece el \n
    posicion = cadena.indexOf("\n");  
    while (posicion!= -1) { // mientras se encuentre el caracter \n
      contador++;  // lo cuento
      posicion = cadena.indexOf("\n",posicion+1); // busco la siguiete ocurrencia
    }
    return contador+1;   // devuelvo la cantidad de \n que se encontraron en la cadena enviada 
  }
}   
