import oscP5.*;
import controlP5.*;

ControlP5 cp5;




float t;
double accx, accy, accz;

OneEuroFilter filterAccx, filterAccy, filterAccz;

// sdjkldasjlaskdjjakl

OscP5 osc;

Shapes shapes = new Shapes();
UI ui;

color[] colors;
float sensitivity;
float defaultSpeed;

void setup() {
  background(0);
  
  frameRate(60);
  
  osc = new OscP5(this, 12000);
  
  cp5 = new ControlP5(this);
  
  filterAccx = new OneEuroFilter();
  filterAccy = new OneEuroFilter();
  filterAccz = new OneEuroFilter();
  
  ui = new UI(cp5);
}

void settings() {
  fullScreen();
}

void draw() {
  noStroke();
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  
  t = (frameCount / 100.0);
  
  colors = getPallete(ui.palleteDropdown.getStringValue());
  
  shapes.draw(t, (float) accx, (float) accy, (float) accz);
}

void oscEvent(OscMessage msg) {
  // TouchOSC
  if (msg.checkAddrPattern("/accxyz")) {
    if (msg.checkTypetag("fff")) {
      accx = msg.get(0).floatValue();
      accy = msg.get(1).floatValue();
      accz = msg.get(2).floatValue();
      return;
    }  
  }
  // Syntien
  if (msg.checkAddrPattern("/syntien/motion/1/scope2")) {
    if (msg.checkTypetag("fff")) {
        //accx = filterAccx.filter(msg.get(0).floatValue());
        //accy = filterAccy.filter(msg.get(1).floatValue());
        //accz = filterAccz.filter(msg.get(2).floatValue());
        accx = msg.get(0).floatValue();
        accy = msg.get(1).floatValue();
        accz = msg.get(2).floatValue();
        return;
    }
  }
  
  // println("### received an osc message. with address pattern "+msg.addrPattern());
  // println("### typetag: " + msg.typetag());
}

color[] DEFAULT_PALLETE = new color[]{
  #170F1E,
  #C7904F,
  #B61218,
  #4C8493,
  #AB4C26,
  #E9C663,
  #BD7897,
  #0C6953,
  #CAA639
};

color[] FIRE_PALLETE = new color[]{
  #EE4540,
  #C72C41,
  #801446,
  #510A32,
  #2D142C,
  #EE4540,
  #C72C41
};

color[] getPallete(String name) {
  switch (name) {
    case "fire":
      return FIRE_PALLETE;
    default:
      return DEFAULT_PALLETE;
  }
}
