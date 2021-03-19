
/* 
A sketch that pulls images from archive and displays in a B X 5 grid
in this case 8 X 5, max amout of images in this version is 733 
images belong in data folder within processing sketch 

*/

PImage[] images = new PImage[733];
long timerStart = 0;
PImage tempImage;
boolean changePic = false;
boolean readyForNewPic = true;
void setup() {
  fullScreen();
  //size(1000, 1000);
  background(0);
 
  for (int i = 0; i < 100; i++) {
    images[i] = loadImage("image" + (int)random(733) + ".jpg");
  }
}

void draw() {
  if (changePic) {
     
    
   //these two lines let me change one tile from 100
    int idx = (int)random(40);
    images[idx] = tempImage.copy();
    changePic = false;
    readyForNewPic = true;
  }
  
  if (millis() - timerStart > 10) { // Change pic every X seconds
    if (readyForNewPic) {
      readyForNewPic = false;
      changePic = false;
      thread("getNewPic");
      timerStart = millis();
    }
  }
  
  for (int i = 0; i < 8; i++) { //across grid
    for (int j = 0; j < 5; j++) { //down grid
      image(images[i * 5 + j], i * 200, j * 200, 200, 200);
    }
  }
}

void getNewPic() {
  tempImage = loadImage("image" + (int)random(733) + ".jpg");
  changePic = true;
}