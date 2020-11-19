class Resizing {
   float ph;  // tomo el tamaño de la pantalla original para usarlo y posicionalro de forma relativa a el tamano original
   float pw;  

  Resizing () {
     ph = height;  // tomo el tamaño de la pantalla original para usarlo y posicionalro de forma relativa a el tamano original
     pw = width;  
  }
  
  float R_width( float x) {
    return x * (width/pw);
    
  }
  float R_height( float y) {
    return y * (height/ph);    
  }
  float R_textSize( float y) {
    return textSize * (height/ph);    
  }
    
}
