class Celda {
  
  int x;
  int y; 
  boolean visitada;
  boolean norte, sur, este, oeste;
  
//---------------------------------------------------- 
  Celda (int py, int px) {
    x = px;
    y = py;
    visitada = false;
    norte = true;
    sur = true; 
    este = true;
    oeste = true;
  }
  
//----------------------------------------------------  
  void dibujar(int celdaSize) {
    
    //int celdaSize = width/30; 
    int px = x * celdaSize;
    int py = y * celdaSize;
  
     noStroke(); 
     if (visitada) {
       fill (234, 172, 47);
     } 
     else {
       fill (147, 118, 37);
     }
     rect (px, py,celdaSize, celdaSize);
     
     stroke (0);
     strokeWeight(2);
     noFill();
     if(oeste){
       line (px, py, px, py+celdaSize);
     }
     if(norte){
       line (px, py, px+celdaSize, py);
     }
     if(este){
       line (px+celdaSize, py, px+celdaSize, py+celdaSize);
     }
     if(sur){
       line (px, py+celdaSize, px+celdaSize, py+celdaSize);
     }
 }
}
