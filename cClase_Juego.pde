class Juego {

  //https://www.youtube.com/watch?reload=9&v=3koPbdj4pHY
  
  int tabHeight, tabWidth;
  int celdaSize;
  Celda [][] tablero = new Celda [100][100];
  ArrayList<Celda> caminoRespuesta = new ArrayList<Celda>(); //guardar el camino mas largo
  int timerSolucion = 0;
  personaje mufasa; 
  personaje scar;
  Celda celdaFin;
  boolean juegoTermino = false;
  PImage Pantalla_Fin;
  AudioPlayer rugido;
  Boton boton_solucion;
  int tiempoInicial;
  int tiempoTotal = 45000; //45 segundos

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
     scar = new personaje (celdaFin.x, celdaFin.y,"scar.png","paso2.mp3");
    
     Pantalla_Fin = loadImage ("pelea.jpg");
     rugido = minim.loadFile ("rugido.mp3");
          
     boton_solucion = new Boton (20, height ,0, "Solución", 20); //creo el boton 
     
     tiempoInicial = millis(); //guarda el timepo a la hora que incia el juego
    }
  
//---------------------------------------------------- 
  int jugar() {
    int tiempoJuego;
        
     // busco el tamaño de la celda
    if (width/tabWidth < (height -65)/tabHeight) {
      celdaSize = width / tabWidth;
    }
    else {
      celdaSize = (height -65)/ tabHeight;
    }
    
    tiempoJuego = millis() - tiempoInicial; // diferencia entre el tiempo que hay ahora y desde que empezó
    background(0);
    
    
    if (!juegoTermino) { //si el juego no termino sigo dibujando el tablero     
        for (int i=0; i<tabHeight; i++){
          for (int j=0; j<tabWidth; j++){
            tablero [i][j].dibujar(celdaSize);  
          }
        }  
       if (timerSolucion >= 0){ //si apretaron el boton de solucion que me dibuje el camino y que comience el contador de la solucion
            mostrar_camino();
            timerSolucion --;
       }
       
        mufasa.dibujar(celdaSize);
        scar.dibujar (celdaSize);
       
        boton_solucion.mostrar_abajo_izquierda();        
           
        //temporizador
        if (tiempoJuego > tiempoTotal) {           
            juegoTermino=true;  
        } 
         text (MsConversion(tiempoTotal-tiempoJuego), (width/2)+(width/4), height - 40); 
         return 0;
     }
     
    else { 
      if (tiempoJuego < tiempoTotal) {  //si el tiempo es mennor significa que terminó antes del tiempo y ganó 
        rugido.play();
        return 1; // juego termino y ganó 
      }
      else { //juego terminado por exceso de tiempo
        return 2; // juego terminó y perdió
      }
    }
  }
    
//----------------------------------------------------    
 void mousePressed() {
   
   if (!juegoTermino && boton_solucion.clickeado() ){
     if (timerSolucion >= 0) // forzamos a que se muestre o no la solucion
       timerSolucion = 0;
     else timerSolucion = 500;  //inicializo el contador para mostrar solucion         
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

//----------------------------------------------------
  String MsConversion(int MS) { //metodo para convertir los milisegundos en segundos
    
    int totalSec= (MS / 1000);
    int seconds = (MS / 1000) % 60;
    int minutes = (MS / (1000*60)) ;               

  String HumanTime= (nf (minutes,2)+ ":"+ nf(seconds,2));
  return (HumanTime);
  }
}
