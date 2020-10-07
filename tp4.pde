PFont titulo, texto;
int nroPagina, boton, tamText, alto;
float boton1_x1=0,boton1_x2=0,boton1_y1=0,boton1_y2 =0;
float boton2_x1=0,boton2_x2=0,boton2_y1=0,boton2_y2 =0;

//defino un arreglo bidimensional para guarda la secuenca de páginas que siguen las distintas historias. Cada página tiene 2 opciones
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
                       {12,13}, // P11 encuentra = (P12 scarVive / P13 ScarMuere)
                       {0,14}, // P12 scarVive = (P0 presentacion / P14 creditos)
                       {0,14}, //  P13 ScarMuere = (P0 presentacion / P14 creditos)
                       {0,0} // P14 creditos = (P0 presentacion / P0 presentacion)                     
                     };  
                     
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
                       "Los elefantes lo encuentran y lo matan\ncon una estampida.",
                       "Luego de unos días buscando, lo\nencunetra:",
                       "Mufasa vuelve al reino y todo continúa\ncomo antes.",
                       "Mufasa vuelve al reino y todo continúa\ncomo antes.",
                       ""};      
                       
//arreglo bidimensionla con los textos de los dos botones que tiene cada página 
String [][] textoBoton = { {"", ""},
                       {"1. Simba llama a su\n padre por ayuda", "2. Simba logra salir\n sin ayuda y Scar huye"},
                       {"1. Lo lorga, pero Scar\n mata a Mufasa","2. No lo logra y el \nreino esta de luto \npor la muerte del \npríncipe"},
                       {"Volver","Créditos"},
                       {"Volver","Créditos"},
                       {"1. Mufasa, que estaba presente\n gracias a Zazú que le avisó,\n lo ve a Scar y lo\n comienza a perseguir","2. Scar logra escapar\nsin ser visto por nadie"},
                       {"1. Muere Scar","1. Muere Mufasa"},
                       {"Volver","Créditos"},
                       {"Volver","Créditos"},
                       {"1. Mufasa les pide ayuda a\nlos animales del reino\npara buscar a Scar","2. Mufasa decide ir a\nbuscarlo solo"},
                       {"Volver","Créditos"},
                       {"1. Mufasa lo deja \ncon vida a cambio de que\nScar se marche y\nnunca jamás vuelva al reino","2. Pelean hasta que\nMufasa mata a Scar"},
                       {"Volver","Créditos"},
                       {"Volver","Créditos"},
                       {"Comenzar de nuevo",""}                       
                         };                                                                                    
                                          
PImage [] paginas = new PImage[historia.length]; //defino un arreglo donde cargo las páginas de la historia                  
     
void setup(){
   size(1024, 768);
   surface.setResizable(true);
  
   titulo = loadFont("Castellar-48.vlw");  //cargo las fuentes
   texto = loadFont("Arial-BoldItalicMT-48.vlw"); 
   tamText = 20;
   textSize(tamText);
   textAlign(CENTER, CENTER);  //alíneo el texto dentro del rectángulo
   
   for (int i=0; i<=14; i++) {    //cargo las imágenes en un arreglo con las páginas de la historia
      paginas[i] = loadImage("P"+(i)+".jpg"); 
   }

   nroPagina = 0; //páginal inicial de la historia 
}

void draw(){  
  
  DibujarPagina (nroPagina);
     
  if (boton == 1) {    //si apreto botón 1 salto a la página correspondiente de la historia
    nroPagina = historia[nroPagina][0];     
  }
  else if (boton == 2) {   //si apreto botón 2, salto a la página correspondiente según la historia
    nroPagina = historia[nroPagina][1];
  }
  boton = 0; //limpia el boton  
}  
