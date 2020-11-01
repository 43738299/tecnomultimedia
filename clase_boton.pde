class Boton {
    
  color bcolor;
  int x1,y1;
  float ph; // porcentaje del Height
  float pw; // porcentaje del Widht
  String text;
  int textSize;
  boolean visible;
  
  Boton (int px1, int py1,  color pcolor, String ptext, int ptextSize) {    
      ph= height;  // tomo el tamano de la pantalla original para usarlo y posicionalro de forma relativa a el tamano original
      pw= width;
            
      x1=px1;   
      y1=py1;
      bcolor=pcolor;
      text=ptext;
      visible=true;
      textSize = ptextSize;
      visible=true;
  } 
    
  void mostrar() {
    float ts; 
    
    if (visible) {
      fill(bcolor);
      strokeWeight(5);
      stroke(255);
      ts = textSize * height/ph; //recalumos el textsize segun el tamaño de la pantalla 
      textSize(ts);
      rect(x1 * (width/pw), y1 * (height/ph), textWidth(text)+20 , ts+10 ,15, 15, 15, 15);
      fill(255);
      text(text, x1 * (width/pw) + 10 , y1 * (height/ph)+ts );
    }
  }
  boolean clickeado() { //metodo booleano porque devuelve algo a diferencia de los voids
    float ts;        
      
      ts = textSize * height/ph; //recalumos el textsize segun el tamaño de la pantalla      
      if (visible && (mouseX > x1*width/pw) && (mouseX < x1*width/pw+textWidth(text)+20) && (mouseY > y1*height/ph) && (mouseY < y1*height/ph+ts+10) )
        return true;
      else return false;     
  } 
}
