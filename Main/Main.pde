import SimpleOpenNI.*;

SimpleOpenNI kinect;
PImage videoImage;

void setup() {
  size(640, 480);
  while (true) {
    if (kinect.deviceCount() > 0) {
      break;
    }
  }
  kinect = new SimpleOpenNI(this);
  kinect.enableRGB();
  frameRate(20);
}
void draw() {
  kinect.update();
  videoImage = kinect.rgbImage();
  image(videoImage, 0, 0, 640, 480);
}
void mousePressed() {
  int x = mouseX;
  int y = mouseY;
  color hsv = videoImage.get(x,y);
  println(
    "hue: " + hue(hsv) + ", " + 
    "saturation: " + saturation(hsv) + ", " + 
    "brightness: " + brightness(hsv));
}
