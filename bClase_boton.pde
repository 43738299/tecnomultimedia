class Boton {
    
  color bcolor;
  int x1,y1,x2,y2;
  float ph; // porcentaje del Height
  float pw; // porcentaje del Widht
  String text;
  int textSize;
  boolean visible;
  
  
//----------------------------------------------------------------------  
  Boton (int px1, int py1,  color pcolor, String ptext, int ptextSize) {
    
   ph = height;  // tomo el tamaño de la pantalla original para usarlo y posicionalro de forma relativa a el tamano original
   pw = width;
    
            
    x1=px1;   
    y1=py1;
      
    bcolor=pcolor;
    text=ptext;
    visible=true;
    textSize = ptextSize;     
      
    if (text =="") 
      visible = false;
    else
      visible=true;
        
    x2 = int(x1 + textWidth(text)+20);
    y2 = int(y1 + (textSize+textSize*0.5) * contarLineas(text));  
  } 

//----------------------------------------------------------------------        
  void mostrar_abajo_izquierda() {
    float ts; 
    
    if (visible) {
      ts = textSize * (height/ph); //recalculo el textsize segun el tamaño de la pantalla 
      textSize(ts);      
      
      x1 = 40;
      y1 = int(height-(40+10+(ts+ts*0.5) * contarLineas(text)+10));
      
      x2 = x1+ 10+int(textWidth(text))+10;
      y2 = y1+ 5+int(ts+ts*0.5) * contarLineas(text)+5;
      
      fill(bcolor);
      rectMode(CORNER);
      strokeWeight(5);
      stroke(255);
            
      rect(x1, y1 , (x2-x1), (y2-y1) ,15, 15, 15, 15);      

      fill(255);      
      textAlign(CORNER);
      text(text, x1+10, y1+25);      
    }
  }  
  
//----------------------------------------------------------------------        
  void mostrar_abajo_derecha() {
    float ts; 
    
    if (visible) {
      ts = textSize * (height/ph); //recalculo el textsize segun el tamaño de la pantalla 
      textSize(ts);      
      
      x1 = int(width-(40+10+textWidth(text)+10));
      y1 = int(height-(40+10+(ts+ts*0.5) * contarLineas(text)+10));
      
      x2 = x1+ 10+int(textWidth(text))+10;
      y2 = y1+ 5+int(ts+ts*0.5) * contarLineas(text)+5;
      
      fill(bcolor);
      rectMode(CORNER);
      strokeWeight(5);
      stroke(255);
            
      rect(x1, y1 , (x2-x1), (y2-y1) ,15, 15, 15, 15);      

      fill(255);      
      textAlign(CORNER);
      text(text, x1+10, y1+25);
    }
  }  
  
//----------------------------------------------------------------------        
  boolean clickeado() { //metodo booleano porque devuelve algo a diferencia de los voids  
    if (visible && (mouseX > x1) && (mouseX < x2) && (mouseY > y1) && (mouseY < y2))
      return true;
    else return false;     
  }
  
//----------------------------------------------------------------------  
  void actualizaBoton (int px1, int py1,  color pcolor, String ptext, int ptextSize) { //le cambio el texto, la posicion al botón anterior para reutilizar el que ya tengo
    float ts;
            
    x1 = px1;   
    y1 = py1;
    ts = textSize * (height/ph); //recalumos el textsize segun el tamaño de la pantalla 
    x2 =int(x1 * (width/pw) + textWidth(text)+20);
    y2 = int(y1 * (height/ph) + (ts+ts*0.5) * contarLineas(text));
    bcolor = pcolor;
    text = ptext;      
    textSize = ptextSize;
    if (text =="") 
      visible=false;
    else
      visible = true;
  }  
  
//----------------------------------------------------------------------  
  //función para calcular la cantidad de línes que ocupa un string
  int contarLineas (String cadena) {
  
    int posicion, contador =0;
    // busca la primera vez que aparece el \n
    posicion=cadena.indexOf("\n");  
    while (posicion!=-1) {     // mientras se encuentre el caracter \n
      contador++;  // lo cuento
      posicion =cadena.indexOf("\n",posicion+1); // busco la siguiete ocurrecncia
    }
    return contador+1;   // devulevo la cantidad de \n que se encontraron en la cadena enviada 
  }
}
