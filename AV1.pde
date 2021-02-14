int x, x2, x4, y, y2, y4, xCarro, xCarro2;
boolean parado;
int segundos, reset;
void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  x = width;
  y = height;
  x2 = x / 2;
  x4 = x / 4;
  y2 = y / 2;
  y4 = y / 4;
  background(120, 50, 100);
  parado = false;
  segundos = 0;
  reset = 0;
  xCarro = 0;
  xCarro2 = x;
}

void draw() {
  background(120, 50, 100); // gramado
  reset = millis() - segundos;
  fill(0, 0, 40);
  rect(x2-x4/5, y4/2, x/8, y/5); //Semáforo
  fill(50, 60, 100);
  rect(0, y2-y4/5+y/10, x, y2); // Areia
  fill(0, 0, 50);
  rect(0, y2-y4/5, x, y/8); // Avenida
  fill(0, 0, 80);
  rect(0, y2-y4/3, x, y/30); //calçada
  rect(0, y2+y4/3.33, x, y/30); // calçada
  fill(140, 20, 80);
  rect(0, y2, x, y/60); // canteiro
  fill(360, 0, 100);
  rect(x2, y2-y4/5, x/40, y/8);   // Faixa pedestre
  fill(0, 100, 0);  
  rect(xCarro, y2+y4/10, x/15, y/25); // carro preto
  xCarro++;
  fill(180, 100, 40);
  rect(xCarro2, y2-y4/5.5, x/15, y/25); // carro azul
  xCarro2--;
  rect(x4+x4/5,y2+y4,x4/10,y/20);
  fill(60,50,100);
  ellipse(x4,y2+y4, x4/5,y4/5);
  fill(0, 100, 0);
   
  // pessoa
  ellipse(x4+x4/4,y2+y4, x4/15,y4/15);
  line(x4+x4/4, y2+y4+y4/28, x4+x4/4, y2+y4*1.2);
  line(x4+x4/4, y2+y4+y4/15, x4+x4/3, y2+y4);
  line(x4+x4/4, y2+y4+y4/15, x4*1.17, y2+y4);
  line(x4+x4/4, y2+y4+y4/5, x4+x4/3.3, y2+y4*1.24);
  line(x4+x4/4, y2+y4+y4/5, x4+x4/5.3, y2+y4*1.24);
  
  
  textSize(x4/15);
  text("Skol", x4-x4/17, y2+y4*1.01);

  // timer
  textSize(x/20);
  text(reset/1000, x2, y4/5);

  // contador de tempo do sinal
  fill(0, 0, 50);
  if (reset/1000 == 0 && parado) {
    fill(360, 100, 100);
  }
  ellipse(x2-x4/7, y4-y4/3, x/40, y/40);
  if (reset/1000 == 1 && parado) {
    fill(360, 100, 100);
  }
  ellipse(x2-x4/7, y4-y4/5, x/40, y/40);
  if (reset/1000 == 2 && parado) {
    fill(360, 100, 100);
  }
  ellipse(x2-x4/7, y4-y4/14, x/40, y/40);
  if (reset/1000 == 3 && parado) {
    fill(360, 100, 100);
  }
  ellipse(x2-x4/7, y4*1.07, x/40, y/40);
  fill(0, 0, 50);
  if (reset/1000 == 0 && !parado) {
    fill(90, 100, 100);
  }
  ellipse(x2+x4/4.2, y4-y4/3, x/40, y/40);
  if (reset/1000 == 1 && !parado) {
    fill(90, 100, 100);
  }
  ellipse(x2+x4/4.2, y4-y4/5, x/40, y/40);
  if (reset/1000 == 2 && !parado) {
    fill(90, 100, 100);
  }
  ellipse(x2+x4/4.2, y4-y4/14, x/40, y/40);
  if (reset/1000 == 3 && !parado) {
    fill(90, 100, 100);
  }
  ellipse(x2+x4/4.2, y4*1.07, x/40, y/40);

  //temporizador
  fill(0, 0, 50);
  if (reset/1000 > 4) {
    segundos = millis(); 
    parado = !parado;
  } else if (parado) {
    fill(360, 100, 100);
  }
  ellipse(x2+x4/16, y4-y4/4, x/20, y/20);
  fill(0, 0, 50);
  if (!parado) {
    fill(90, 100, 100);
  } else if (reset/1000 > 4) {
    segundos = millis();
  }
  ellipse(x2+x4/16, y4, x/20, y/20);

  // veiculo para logo antes da faixa
  if (xCarro == x2-x4/3 && parado == true) {
    xCarro--;
  }
  if (xCarro2 == x2+x4/5 && parado == true) {
    xCarro2++;
  }

  // animação cíclica
  if (xCarro == x) {
    xCarro = -x/15;
  } else if (xCarro2 == 0-x/15) {
    xCarro2 = x + x/15;
  }
}
void mousePressed() {
  parado = !parado;
}
