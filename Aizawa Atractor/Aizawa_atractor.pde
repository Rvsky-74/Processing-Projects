void setup(){
  size(700,700,P3D);
  background(0);
  
  stroke(20,100,255);
  strokeWeight(2);
}

int zoom = 70; 

//Initial point. Try changing to different points for slightly different results
float x = 0.1; 
float y = 0;
float z = 0;


float dt = 0.01;
float dx,dy,dz;


void draw(){  
  translate(width/2,height/2,0);
  
  for (int i =0;i<10;i++){ // Plot 10 points at once before updating the screen (draw() function) to increase program speed
    
    //Aizawa attractor system
    dx = (z-0.7) * x - 3.5*y;
    dy = 3.5 * x - (z-0.7) * y; 
    dz = 0.65 + 0.95*z - (pow(z,3)/3) -(pow(x,2) + pow(y,2))*(1+0.25*z) + 0.1*z*pow(x,3);
    
    x += dt*dx;
    y += dt*dy;
    z += dt*dz;
    
    point(y*zoom,z*zoom,x*zoom);
  }
  delay(20); //delay in ms between drawings on the scree. Decrease the value for faster execution 
}
