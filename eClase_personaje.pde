class personaje {
  
  int y, x;
  PImage img;  
  AudioPlayer sonido_caminar;
//----------------------------------------------------  
  personaje (int px, int py,  String pimg, String psonido_caminar ) {
    y=py;
    x=px;        
    img = loadImage (pimg);
    sonido_caminar = minim.loadFile (psonido_caminar);
  }
  
 void dibujar (int celdaSize) {
     image (img, x*celdaSize,y*celdaSize,celdaSize, celdaSize);    
 }
  
//----------------------------------------------------
void mover (int key, int keyCode, Celda [][] tablero, int tabHeight, int tabWidth){
  int mx,my;
  mx=x; // guardo x e y para ver si caminó
  my=y;
  
    if (key == CODED) { 
      if (keyCode == UP && y>0 && !tablero [y][x].norte) {
        y--;        
      }
      else if (keyCode == DOWN && y<tabHeight && !tablero [y][x].sur) {
        y++;         
      } 
      else if (keyCode == RIGHT && x<tabWidth && !tablero [y][x].este) {
        x++;
      } 
      else if (keyCode == LEFT && x>0 && !tablero [y][x].oeste) {
        x--;         
      }
    }
    if (mx !=x || my!=y) {
      sonido_caminar.rewind();
      sonido_caminar.play();
    }
  }
}
