int x, y;
int step = 1;
int stepSize = 1;
int numSteps = 1;
int state = 0;
int turnCounter = 0;
int px, py;
int totalSteps = 0;

void setup() {
  //frameRate(15);
  size(2160, 2160);
  background(0);
  int cols = width / stepSize;
  int rows = height / stepSize;
  totalSteps = cols * rows;
  x = width / 2;
  y = width / 2;
}

void draw() {
  fill(255);
  stroke(255);
  rectMode(CENTER);
  while(step <= totalSteps){
    if(isPrime(step)) point(x,y);//circle(x, y, stepSize*0.25);
    px = x;
    py = y;
    switch (state){
      case 0:
        x += stepSize;
        break;
      case 1:
        y -= stepSize;
        break;
      case 2:
        x -= stepSize;
        break;
      case 3:
        y+= stepSize;
        break;
    }
    if(step % numSteps == 0){
      state = ++state % 4;
      if(++turnCounter % 2 == 0) numSteps++;
    }
    step++;
  }
  //if(step > totalSteps) noLoop();
  save("UlamSpiral.jpg");
}

boolean isPrime(int value){
  if(value == 2) return true;
  if(value == 1 || value % 2 == 0) return false;
  for (int i = 3; i <= sqrt(value); i+=2){
    if(value % i == 0) return false;
  }
  return true;
}
