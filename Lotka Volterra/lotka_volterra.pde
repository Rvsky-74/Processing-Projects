void setup(){
  size(800,800);
  for (int i = 0; i<n; i++){
    float f = random(1,10);
    float g = random(1,10);
    foxes[i] = new PVector(0,f);
    rabits[i] = new PVector(0,g);
    
    //Coment one to change between random colors or black dots
    //PVector c = new PVector(random(0,255),random(0,255),100);
    PVector c = new PVector(0,0,0);
    colors[i] = c;
  }  
}
//array of pVectors of type (prev, next)
//this type allows the ploting to be more smooth by having some "drag" in the movement
int n = 200;
PVector[] foxes = new PVector[n]; 
PVector[] rabits = new PVector[n]; 
PVector[] colors = new PVector[n];

float h = 0.0005;
int zoom = 35;

void draw(){
  translate(0,height);
  background(200); //deleting this line keeps the lines, allowing to see the trajectory of a point
 
  for (int i = 0; i<n; i++){
    PVector f = foxes[i];
    PVector r = rabits[i];    

    // save the previous position to the first slot (x), to then compute the new value and place it in y
    f.x = f.y;
    r.x = r.y;
    
    //compute the lotks-volterra equations
    f.y = f.x + h * f2(r.x,f.x);
    r.y = r.x + h * f1(r.x,f.x);   

    //plot the points, where x-axis is the amount of rabits and y-axis is the amount of foxes
    stroke(colors[i].x, colors[i].y, colors[i].z);
    strokeWeight(5);
    line(r.x*zoom,-f.x*zoom, r.y*zoom,-f.y*zoom);    
  }  
}


float a = 40;
float b = 8;
float c = 8;
float d = 30;

//lotka volterra equations
float f1(float r, float f){ //rabits
  return a*r - b*r*f;
}

float f2(float r, float f){ //foxes
  return r*r*f - d*f;
}
