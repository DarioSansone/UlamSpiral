let x, y;
let step = 1;
let stepSize = 5;
let numSteps = 1;
let state = 0;
let turnCounter = 0;
let px, py;
let totalSteps = 0;

function setup() {
  //frameRate(15);
  textSize(stepSize);
  createCanvas(500, 500);
  background(0);
  const cols = width / stepSize;
  const rows = height / stepSize;
  totalSteps = cols * rows;
  x = width / 2;
  y = width / 2;
}

function draw() {
  fill(255);
  stroke(255);
  rectMode(CENTER);
  if(isPrime(step)) circle(x, y, stepSize*0.25);
  //line(x, y, px, py);
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
  if(step > totalSteps) noLoop();
}

function isPrime(value){
  if(value == 2) return true;
  if(value == 1 || value % 2 == 0 || typeof(value) != 'number') return false;
  for (let i = 3; i <= sqrt(value); i+=2){
    if(value % i == 0) return false;
  }
  return true;
}