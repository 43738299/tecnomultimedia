//función que activa una página con sus respectivos textos y botones de selección
void DibujarPagina (int pagina) {

    float xrt, yrt;
    
    //definir coordenadas relativas de los rectángulos
    xrt = width/2;
    yrt = height/7;
    
    image(paginas[pagina], 0, 0, width, height);  //cargar fondo
    
    if (textosPantalla [pagina] != "") {  //si la pantalla tiene textos
      
      
      // posicionar pantallas personalizadas: 0 y 13
      if (pagina == 13){
          yrt = height/2;
        }
      else if (pagina == 0){
          yrt = height- 50 - (20+tamText*(contarLineas(textosPantalla[pagina])+1)+20)/2; 
          xrt = width - 250 - (20+textWidth(textoBoton[pagina][0])+20 ) /2;      
          fill(0);
          textFont(titulo, 50);
          text("El rey león", xrt, yrt-130);  
        }
      else {
        yrt = yrt + (20+tamText*(contarLineas(textosPantalla[pagina])+1)+20)/2; //le sumo medio cuadrado
      }
    
      fill (0); //iniciamos a construit el rectángulo de fondo para los textos
      rectMode(CENTER);
      
      if (nroPagina != 0){
        rect(xrt , yrt, 20+textWidth(textosPantalla[pagina])+20, 20 + tamText*(contarLineas(textosPantalla[pagina])+1) + 20, 15, 15, 15, 15);      
        strokeWeight(5);
        stroke(255);
        fill(255);
      }
    
      textFont(texto, 20);
      text(textosPantalla[pagina], xrt, yrt); 
    
      //yrt = yrt + (20 + tamText*(contarLineas(textosPantalla[pagina])+1) + 20) /2; //le sumo la otra mitad del rectangulo
    
    }
  
   //activamos los botones de la página
   if (textoBoton[pagina][0] != "") { //si hay botón 0:
   
      // calculamos coordenadas del boton 1
      yrt =  height - 40 - (20+tamText * (contarLineas(textoBoton[pagina][0])+1)+20 ) /2;
      xrt = 40 +  (20+textWidth(textoBoton[pagina][0])+20 ) /2 ; // desplazamiento del margen izq
        
      boton1_y1 = yrt - (20+tamText * (contarLineas(textoBoton[pagina][0])+1)+20 ) /2 ;
      boton1_y2 = yrt + (20+tamText * (contarLineas(textoBoton[pagina][0])+1)+20 ) /2 ;
      boton1_x1 = xrt - (20+textWidth(textoBoton[pagina][0])+20 ) /2;
      boton1_x2 = xrt + (20+textWidth(textoBoton[pagina][0])+20 ) /2;
      
      fill(0);
      rectMode(CORNERS);
      rect(boton1_x1, boton1_y1, boton1_x2,  boton1_y2,15, 15, 15, 15);
      fill(255);
      textFont(texto, 20);
      text(textoBoton[pagina][0],xrt, yrt); //bot. 1
    }
    
  if (textoBoton [pagina][1] != "") { //si hay botón 1:
    
    // calculamos coordenadas del boton 2 
    yrt =  height - 40 - (20+tamText * (contarLineas(textoBoton[pagina][0])+1)+20 ) /2;
    xrt = width - (40 +  (20+textWidth(textoBoton[pagina][0])+20 ) /2 ); // desplazamiento del margen izq
        
    boton2_y1 = yrt - (20+tamText * (contarLineas(textoBoton[pagina][1])+1)+20 ) /2 ;
    boton2_y2 = yrt + (20+tamText * (contarLineas(textoBoton[pagina][1])+1)+20 ) /2 ;
    boton2_x1 = xrt - (20+textWidth(textoBoton[pagina][1])+20 ) /2;
    boton2_x2 = xrt + (20+textWidth(textoBoton[pagina][1])+20 ) /2;
      
    fill(0);
    rectMode(CORNERS);
    rect(boton2_x1, boton2_y1, boton2_x2,  boton2_y2,15, 15, 15, 15);
    fill(255);
    textFont(texto, 20);
    text(textoBoton[pagina][1],xrt, yrt); //bot. 2
  }
}  //cierra DibujarPagina


//función para calcular la cantidad de línes que ocupa tiene un string
int contarLineas (String cadena) {
  int posicion, contador =0;
  // busca la primera vez que aparece el \n
  posicion=cadena.indexOf("\n");  
  while (posicion!=-1) {     // mientras se encuentre el caracter \n
    contador++;  // lo cuento
    posicion =cadena.indexOf("\n",posicion+1); // busco la siguiete ocurrecncia
  }
  return contador;   // devulevo la cantidad de \n que se encontraron en la cadena enviada 
}

void keyPressed(){
  if (keyCode == ENTER && nroPagina == 0) {
    nroPagina = historia[nroPagina][1];
  }
} 
