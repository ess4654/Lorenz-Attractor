float a, b, c;
float x, y, z;
float dx, dy, dz;
float dt, deg;
int[] RGB = new int[3];
ArrayList<PVector> points = new ArrayList<PVector>();

void setup()
{
  size(800, 600, P3D);
  noFill();
  
  a = 10.0;
  b = 28.0;
  c = 8.0/3.0;
  
  x = 0.01;
  y = z = 0;
  dt = 0.01;
}

void draw()
{
  background(0);
  translate(width / 2, height / 2);
  scale(5);
  rotateY(deg);
  if(mousePressed)
    deg += 0.05;
    
  dx = (a * (y - x)) * dt;
  dy = (x * (b - z) - y) * dt;
  dz = (x * y - c * z) * dt;
  
  x += dx;
  y += dy;
  z += dz;
  points.add(new PVector(x, y, z));
  
  beginShape();
  RGB[0] = 255;
  RGB[1] = RGB[2] = 0;
  for(PVector v:points)
  {
    vertex(v.x, v.y, v.z);
    update(RGB);
    stroke(RGB[0], RGB[1], RGB[2]);
  }
  endShape();
}

void update(int[] RGB)
{
  for(int i = 0; i<3; ++i)
  {
    RGB[i] = (RGB[(i+1) % 3] == 0 &&
    RGB[i] != 255) ? RGB[i] + 1:RGB[i];
    RGB[i] = (RGB[(i+1) % 3] == 255 &&
    RGB[i] != 0) ? RGB[i] - 1:RGB[i];
  }
}
