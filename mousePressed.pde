
void mousePressed() {
   
   if (mouseX>=20 && mouseX <=20+200 && mouseY>=670 && mouseY<=670+70) {
     estado = "presentacion"; // botón volver
   } 
  
  if (mouseX>=800 && mouseX <=800+200 && mouseY>=670 && mouseY<=670+70) {
    estado = "creditos"; // botón créditos
  }
  
  if (mouseX>=20 && mouseX <=20+200 && mouseY>=110 && mouseY<=110+90 && estado == "estampida") {
     estado = "intentaSalvar"; // boton 1
   }
  
   else if (mouseX>=250 && mouseX <=250+240 && mouseY>=110 && mouseY<=110+90 && estado == "estampida") {
     estado = "scarHuye"; //boton 2
   }

   else if (mouseX>= 250 && mouseX <=250+240 && mouseY>=110 && mouseY<= 110+90 && estado=="intentaSalvar") {
    estado = "reinoScar"; //boton 3
  }
   
   else if (mouseX>= 20 && mouseX <=20+200 && mouseY>=110 && mouseY<= 110+150 && estado=="intentaSalvar") {
    estado = "reinoLuto"; //boton 4
  }

  else if (mouseX>=20 && mouseX <=20+320 && mouseY>=110 && mouseY<=110+140 && estado == "scarHuye" ) {
    estado = "Pelea"; //boton 5
  }

   else if (mouseX>=20 && mouseX <=20+320 && mouseY>=260 && mouseY<=260+70 && estado == "scarHuye" ) {
    estado = "sym"; //boton 6
   }

  else if (mouseX>=20 && mouseX <=20+170 && mouseY>=110 && mouseY<=110+50 && estado == "Pelea" ) {
    estado = "TodoAntes"; //boton 7
   }

  else if (mouseX>=20 && mouseX <=20+190 && mouseY>=190 && mouseY<=190+50 && estado == "Pelea" ) {
    estado = "scarReino"; //boton 8
   }

  else if (mouseX>=20 && mouseX <=20+420 && mouseY>=110 && mouseY<=110+80 && estado == "sym" ) {
    estado = "elefantes"; //boton 9
   }

  else if (mouseX>=20 && mouseX <=20+370 && mouseY>=220 && mouseY<=220+50 && estado == "sym" ) {
    estado = "encuentra"; //boton 10
   }

  else if (mouseX>=20 && mouseX <=20+450 && mouseY>=110 && mouseY<=110+80 && estado == "encuentra" ) {
    estado = "scarVive"; //boton 11
  }
  
  else if (mouseX>=20 && mouseX <=20+410 && mouseY>=220 && mouseY<=220+50 && estado == "encuentra" ) {
    estado = "scarMuere"; //boton 12
  }
}
