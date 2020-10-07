
void mousePressed() {
   
  if (mouseX>=boton1_x1 && mouseX<=boton1_x2 && mouseY>=boton1_y1 && mouseY<=boton1_y2) {
     boton = 1; // boton 1
  }
  
  else if (mouseX>=boton2_x1 && mouseX<=boton2_x2 && mouseY>=boton2_y1 && mouseY<=boton2_y2 ) {
     boton = 2; //boton 2
  }
   
  else boton=0;
  
}
