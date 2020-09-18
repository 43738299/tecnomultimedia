void pantalla (PImage fondo, String boton1, String boton2, String textos) {

    image(fondo, 0, 0);
    
    fill (0);
    rect(20, 20, 400, 80);
    strokeWeight(5);
    stroke(255);
    fill(255);
    textFont(texto, 20);
    text(textos, 40, 50);
  
    fill(0);
    rect(20, 110, 220, 90);
    fill(255);
    textFont(texto, 20);
    text(boton1, 40, 150); //bot. 1
    
    
    fill(0);
    rect(250, 110, 240, 90);
    fill(255);
    textFont(texto, 20);
    text(boton2, 260, 150); //bot. 2
    

    
}
