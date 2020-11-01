class Juego {

  //https://www.youtube.com/watch?reload=9&v=3koPbdj4pHY
  
  int tabHeight, tabWidth;
  int celdaSize;
  Celda [][] tablero = new Celda [100][100];
  ArrayList<Celda> caminoRespuesta = new ArrayList<Celda>(); //guardar el camino mas largo
  boolean solucion = false;
  personaje mufasa; 
  personaje scar;
  Celda celdaFin;
  boolean juegoTermino = false;
  PImage Pantalla_Fin;
  AudioPlayer rugido;
  Boton boton_solucion;

//----------------------------------------------------
  Juego (int tH, int tW) {
        
     tabHeight = tH;
     tabWidth = tW;     
       
     //cargar la variable con el tablero  
     for (int i=0; i<tabHeight; i++){
       for (int j=0; j<tabWidth; j++){
           tablero [i][j] = new Celda (i,j);  
       } 
     }    
        
     armar_caminos();  
         
     celdaFin = caminoRespuesta.get(caminoRespuesta.size()-1);  // busco la celda final
     tablero[celdaFin.y][celdaFin.x].visitada = false; //pone en no visitada la celda final para que la pinte de rojo
     tablero[0][0].visitada = false; //pintamos en rojo la celda de inicio

    // creo el personaje
     mufasa = new personaje(0,0,"mufasa.png","paso2.mp3");
     scar = new personaje (celdaFin.x, celdaFin.y,"scar.png","paso.mp3");
    
     Pantalla_Fin = loadImage ("pelea.jpg");
     rugido = minim.loadFile ("rugido.mp3");
          
     boton_solucion = new Boton (20, height - 80,0, "Solución", 50); //creo el boton
  }
  
//---------------------------------------------------- 
  void dibujar() {
        
     // busco el tamaño de la celda
    if (width/tabWidth < (height -65)/tabHeight) {
      celdaSize = width / tabWidth;
    }
    else {
      celdaSize = (height -65)/ tabHeight;
    }
    
    
    if (!juegoTermino) { //si el juego no termino sigo dibujando el tablero     
        for (int i=0; i<tabHeight; i++){
          for (int j=0; j<tabWidth; j++){
            tablero [i][j].dibujar(celdaSize);  
          }
        }  
       if (solucion == true){ //si apretaron el boton de solucion que me dibuje el camino
            mostrar_camino();
         }
       
        mufasa.dibujar(celdaSize);
        scar.dibujar (celdaSize);
       
        boton_solucion.mostrar();
    }
    else { 
      image (Pantalla_Fin,0,0,width,height); //cargo la imagen de fondo de la pantalla final
      rugido.play();
      textAlign(CENTER);
      text("Mufasa encuentra a Scar y\ncomienzan a pelear.\n\nContinurá...", width/2,height/6);
      
    }
  }
    
//----------------------------------------------------    
 void mousePressed() {
   
   if (!juegoTermino && boton_solucion.clickeado() ){
     if (solucion) // forzamos a que se muestre o no la solucion
       solucion = false;
     else solucion = true;  //si es falso lo pone true y viceversa         
   } 
 }
    
    //----------------------------------------------------    
void keyPressed (){
    
    if ( !juegoTermino && (key == CODED) && ( (keyCode == UP) || (keyCode == DOWN) || (keyCode == RIGHT) || (keyCode == LEFT) )) {
       mufasa.mover(key, keyCode, tablero, tabHeight, tabWidth); //le digo que me mueva nada mas a mufasa
       if (mufasa.x == celdaFin.x && mufasa.y==celdaFin.y) { //chequeamos si llegó a la celda final
          juegoTermino = true;
          boton_solucion.visible=false; // anulamos el boton de la solucion  
       }
    }  
  }
  
//----------------------------------------------------
  /* Esta método construye el laberinto en el tablero usando el "Algoritmo de Backtracking": va buscando celdas aleatoriamente y construyendo un camino que va guardando en la lista de arreglos llamada camino. 
  Cuando no encuentra mas salidas, retrocede en el camino buscando nuevas rutas para recorer. El algoritmo termina cuando el camino esta vacio y
  ya no quedan celdas para visitar. */
 
  void armar_caminos() {
  
    ArrayList<Celda> Camino = new ArrayList<Celda>(); //guardo el camino que voy haciendo
    
    int cheks; //contador para no quedarse trabado
    int direccion; 
    boolean valido;

    Celda celdaAct;
    Celda celdaNext;
    
    celdaAct = tablero [0][0]; //defino la celda de comienzo de los caminos a analizar 
    celdaAct.visitada = true;
    
    Camino.add (celdaAct); //agrego la celda inicial al arreglo para comenzar con el camino

    while (Camino.size()>0) {
      celdaAct  = Camino.get(Camino.size()-1); //me quedo con la última celda del arreglo (get: me da un elemento del array list)
    
      valido = false;
      cheks = 0;
    
      while(!valido && cheks < 10) {
        direccion = int(random(0,4));  
        cheks++;  
        switch (direccion) {         
        //OESTE / IZQUIERDA
        case 0: 
          if (celdaAct.x > 0) { // no es una celda del borde izquierdo
            celdaNext = tablero [celdaAct.y][celdaAct.x - 1]; 
            
            if (!celdaNext.visitada) {
              celdaAct.oeste = false; //rompemos los muros
              celdaNext.este = false;
              
              celdaNext.visitada = true;
              Camino.add (celdaNext); //agrego al final del array la celda visitada
              valido = true;
            }
          }
        break;
        
        //NORTE / ARRIBA
        case 1:
          if (celdaAct.y > 0) { //no es una celda del borde superior
            celdaNext = tablero [celdaAct.y - 1][celdaAct.x]; 
            
            if (!celdaNext.visitada) {
              celdaAct.norte = false;
              celdaNext.sur = false;
              
              celdaNext.visitada = true;
              Camino.add (celdaNext);
              valido = true;
            }
          }
        break;
        
        //ESTE / DERECHA
        case 2:
          if (celdaAct.x < (tabWidth - 1)) { //no es una celda del borde derecho
            celdaNext = tablero [celdaAct.y][celdaAct.x + 1]; 
            
            if (!celdaNext.visitada) {
              celdaAct.este = false;
              celdaNext.oeste = false;
              
              celdaNext.visitada = true;
              Camino.add (celdaNext);
              valido = true;
            }
          }
        break;  
        
        //SUR / ABAJO
        case 3:
          if (celdaAct.y < (tabHeight -1)) { //no es una celda del borde inferior
            celdaNext = tablero [celdaAct.y + 1][celdaAct.x]; 
            
            if (!celdaNext.visitada) {
              
              celdaAct.sur = false;
              celdaNext.norte = false;
              
              celdaNext.visitada = true;
              Camino.add (celdaNext);
              valido = true;
            }
          }
        break;  
      }
    }
    
    if (Camino.size() >caminoRespuesta.size()) { // guardo una copia del camino por ser más largo
         caminoRespuesta = (ArrayList)Camino.clone();      
    }
    
    if (!valido){   
      Camino.remove(Camino.size()-1);  //saco de la listas de celdas del camino la ultima porque no tiene salida
    }
  }
}
  
 //----------------------------------------------------
  void mostrar_camino(){ //mostramos la respuesta más larga del camino
    Celda celda;
    
    for(int i=0; i<caminoRespuesta.size(); i++){
      celda = caminoRespuesta.get(i); // i es la posicion en la lista de celdas donde esta guardada la celda en la que voy a dibujar el punto 
      noStroke();
      fill(245,105,17);
      ellipse (celda.x*celdaSize + (celdaSize/2), celda.y* celdaSize+(celdaSize/2),celdaSize/4, celdaSize/4);
    }
  }
}
