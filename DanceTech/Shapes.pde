class Shapes {
  
  void draw(float t, float accx, float accy, float accz) {
    float centerDist = 100 + map(accy, -2, 2, -100, 200);
    float memberDist = map(sin(t), -1, 1, 20, 40);
    float memberRot = t + (0.5 + accz * 2);
    float groupRot = t + (accx * 2);
    float generalRot = t;
    groupsCircle(centerDist, memberDist, memberRot,
      groupRot, generalRot, 10, new color[]{ colors[2], colors[5] }); 
    
    centerDist = 160 +  + map(accy, -2, 2, -100, 200);
    generalRot = (1 - t) / 2;
    groupsCircle(centerDist, memberDist, memberRot,
      groupRot, generalRot, 15, new color[]{ colors[1], colors[3] });
    
    centerDist = 230 +  + map(accy, -2, 2, -100, 200);
    generalRot = t / 3;
    groupsCircle(centerDist, memberDist, memberRot,
      groupRot, generalRot, 20, new color[]{ colors[4], colors[6] });
    
    centerDist = 300 +  + map(accy, -2, 2, -100, 200);
    generalRot = (1 - t) / 4;
    groupsCircle(centerDist, memberDist, memberRot, groupRot, generalRot, 15, new color[]{ colors[7], colors[8] });
  }

}

void groupsCircle(float centerDist, float memberDist, float memberRot, float groupRot, float generalRot, float count, color[] colors) {
  pushMatrix();
  translate(width / 2, height / 2);
  
  for (int i = 0; i < count; i++) {
    pushMatrix();
    float rotOffset = map(sin(t), -1, 1, -0.75, 1);
    rotate(2.0 * PI / count * i + generalRot + rotOffset);
    translate(0, centerDist);
    group(memberDist, memberRot, groupRot, colors);
    popMatrix();
  }

  popMatrix();
}
 
void group(float memberDist, float memberRot, float groupRot, color[] colors) {
  pushMatrix();
  rotate(groupRot);
  translate(0, memberDist / 2 * map(sin(t), -1, 1, 1, 1.5));
  member(memberRot, colors[0]);
  popMatrix();
  
  pushMatrix();
  rotate(PI + groupRot);
  translate(0, memberDist / 2 * map(sin(t), -1, 1, 1, 1.5));
  member(memberRot, colors[1]);
  popMatrix();
}

void member(float memberRot, color c) {
  pushMatrix();
  rotate(-memberRot);
  pushStyle();
  fill(c);
  triangle(0, 10, 10, -10, -10, -10);
  popStyle();
  popMatrix();
}
