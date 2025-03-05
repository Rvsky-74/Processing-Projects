class Pendulum{
    float ang1,ang2,v1,v2; 
    PVector p_color;
    
    Pendulum(float a, float b, float c, float d,PVector e) {    
        ang1 = a;
        ang2 = b;
        v1 = c;
        v2 = d;
        p_color = e;
    } 
    
    
    
    void update(){
        // diferential equations for the double pendulum
        float acc1 = (-g*3*sin(ang1)-g*sin(ang1-2*ang2)-2*sin(ang1-ang2)*(v2*v2*r+v1*v1*r*cos(ang1-ang2)))/(r*(3-cos(2*(ang1-ang2))));
        float acc2 = (2*sin(ang1-ang2)*(v1*v1*r*2+g*2*cos(ang1)+v2*v2*r*cos(ang1-ang2)))/(r*(3-cos(2*(ang1-ang2))));
        
        v1+=acc1*t;
        v2+=acc2*t;
        ang1+=v1*t;
        ang2+=v2*t;
    }
    
    
    
    void render(){
        stroke(p_color.x, p_color.y, p_color.z, 150);
        
        float y1 = r*cos(ang1);
        float x1 = r*sin(ang1);
        float x2 = x1 + r*sin(ang2);
        float y2 = y1 + r*cos(ang2);
        
        line(0,0,x1,y1); // upper arm 
        line(x1,y1,x2,y2); // lower arm
    }
}
