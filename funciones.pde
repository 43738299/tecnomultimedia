//función para calcular la cantidad de línes que ocupa un string
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
