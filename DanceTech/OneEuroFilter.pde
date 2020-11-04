class OneEuroFilter {
  double minCutoff;
  double beta;
  double dCutoff;
  double xPrev;
  double dxPrev;
  double tPrev;
  
  OneEuroFilter(double t0, float x0, double dx0, double minCutoff, double beta, double dCutoff) {
    this.minCutoff = minCutoff;
    this.beta = beta;
    this.dCutoff = dCutoff;
    this.xPrev = x0;
    this.dxPrev = dx0;
    this.tPrev = t0;
  }
  
  OneEuroFilter() {
    this(millis(), 0, 0, 1, 0, 1);
  }
  
  double filter(double t, double x) {
    double Te = t - tPrev;
    double alphaD = smoothingFactor(Te, dCutoff);
    double dx = (x - xPrev) / Te;
    double dxHat = exponentialSmoothing(alphaD, dx, dxPrev);
    
    double cutoff = minCutoff + beta * Math.abs(dxHat);
    double a = smoothingFactor(Te, cutoff);
    double xHat = exponentialSmoothing(a, x, xPrev);
    
    xPrev = xHat;
    dxPrev = dxHat;
    tPrev = t;
    
    return xHat;
  }
  
  double filter(double x) {
    return filter(millis(), x);
  }

}

double smoothingFactor(double Te, double cutoff) {
  double r = 2 * PI * cutoff * Te;
  return r / (r + 1);
}

double exponentialSmoothing(double a, double x, double xPrev) {
  return a * x + (1 - a) * xPrev;
}
