void setup(){
    size(1000,1000);
        
    strokeWeight(3);
    
    for (int i = 0;i<n_pendulums;i++){     
        colorMode(HSB,n_pendulums);
        PVector cor = new PVector(i,n_pendulums,n_pendulums);
        
        // the arguments for the Pendulum class are 
        // angle1, angle2, initial velocity of 1, initial velocity of 2, color
        // where 1 and 2 are the middle joint and the tip, respectivly
        p.add(new Pendulum(PI,(i+10)*0.001,0,0,cor)); ///start the pendulums almost verticaly
    }
}

ArrayList<Pendulum> p = new ArrayList<Pendulum>();


int n_pendulums = 100;
float t = 0.1;
int r = 200;
float g = 9.8;

void draw(){
    translate(width/2,height/3); //to place the center of the pendulum slightly above the center of the screen
    background(0,0,0);
    
    //Loop through all pendulums
    for (Pendulum pend : p){
        pend.update();
        pend.render();
    }
}
