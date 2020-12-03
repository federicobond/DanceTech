import oscP5.*;

float t;
double accx, accy, accz;

OneEuroFilter filterAccx, filterAccy, filterAccz;

OscP5 osc;

Shapes shapes = new Shapes();

void setup() {
  background(0);
  
  frameRate(60);
  
  osc = new OscP5(this, 12000);
  
  
  filterAccx = new OneEuroFilter();
  filterAccy = new OneEuroFilter();
  filterAccz = new OneEuroFilter();
}

void settings() {
  fullScreen();
}

void draw() {
  noStroke();
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  
  t = (frameCount / 100.0);
  
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
