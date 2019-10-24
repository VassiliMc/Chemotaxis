int sizeX = 1000;
int sizeY = 1000;
int groupSize = (int)(Math.random()*50)+1;
Bacteria[] batch = new Bacteria[groupSize];
Muncher[] pack = new Muncher[groupSize];
double xPosition[] = new double[groupSize];
double yPosition[] = new double[groupSize];
double xPositionH[] = new double[groupSize];
double yPositionH[] = new double[groupSize];
int oop[] = new int[groupSize];
int tracker = 0;
 void setup()   
 {     
 	size(1000,1000);
 	int store = 0;
 	for(int i = 0; i < batch.length ; i++){
 		store = color((int)(Math.random()*255)+1,(int)(Math.random()*255)+1,(int)(Math.random()*255)+1);
 		batch[i] = new Bacteria(Math.random()*800+100,Math.random()*800+100,Math.random()*16+5,store);
 		batch[i].show();
	}
	for(int i = 0; i < pack.length ; i++){
 		store = color((int)(Math.random()*255)+1,(int)(Math.random()*255)+1,(int)(Math.random()*255)+1);
 		pack[i] = new Muncher(Math.random()*800+100,Math.random()*800+100,Math.random()*16+5,store);
 		pack[i].show();
	}

 }   
 void draw()   
 {    
 	background(255);
 	for(int i = 0; i < batch.length ; i++){
 		tracker = i;
 		batch[i].move(xPositionH[i], yPositionH[i]);
 		if(oop[i] != 1){
 			batch[i].show();
 		}
 		if(xPositionH[i]+10 > xPosition[i] && xPosition[i] > xPositionH[i]-10 && yPositionH[i]+10 > yPosition[i] && yPosition[i] > yPositionH[i]-10){
 			batch[i].hide();
 			oop[i] = 1;
 		}

	}
	for(int i = 0; i < pack.length ; i++){
		tracker = i;
 		if(oop[i] != 1){
 			pack[i].move(xPosition[i], yPosition[i]);
 		} else {
 			pack[i].finish();
 		}
 		pack[i].show();
 		if(xPositionH[i]+10 > xPosition[i] && xPosition[i] > xPositionH[i]-10 && yPositionH[i]+10 > yPosition[i] && yPosition[i] > yPositionH[i]-10){
 			oop[i] = 1;
 		}
	}
 }
 class Muncher{
 	double myX, myY, mySpeed, mySize;
 	int myColour;
 	Muncher(double x, double y, double size, int colour){
 		myX = x;
 		myY = y;
 		mySize = size;
 		myColour = colour;
 	}
 	void finish(){
 		if(myX < sizeX/2){
 			myX = myX + (Math.random()*(mySize/3)-mySize/7);
 		} else {
 			myX = myX + (Math.random()*(mySize/3))-mySize/3;
 		}
 		if(myY < sizeY/2){
 			myY = myY + (Math.random()*(mySize/3)-mySize/7);
 		} else {
 			myY = myY + (Math.random()*(mySize/3))-mySize/3;
 		}
 		xPositionH[tracker] = myX + mySize/2;
 		yPositionH[tracker] = myY + mySize/2;
 	}
 	void show(){
 		stroke(myColour);
 		fill(myColour);
 		rect((float)myX, (float)myY, (float)mySize, (float)mySize);
 	}
 	void move(double x, double y){
 		if(x > myX){
 			if(myX > sizeX/2){
 				myX = myX + (Math.random()*(mySize/3)-mySize*(myX/4200));
 			} else {
 				myX = myX + (Math.random()*(mySize/3))-mySize/7;
 			}
 		} else {
 			if(myX < sizeX/2){
 				myX = myX + (Math.random()*(mySize/3)-mySize*(myX/1800));
 			} else {
 				myX = myX + (Math.random()*(mySize/3))-mySize/3;
 			};
 		}
 		if(y > myY){
 			if(myY > sizeY/2){
 				myY = myY + (Math.random()*(mySize/3)-mySize*(myY/4200));
 			} else {
 				myY = myY + (Math.random()*(mySize/3))-mySize/7;
 			}
 		} else {
 			if(myY < sizeY/2){
 				myY = myY + (Math.random()*(mySize/3)-mySize*(myY/1800));
 			} else {
 				myY = myY + (Math.random()*(mySize/3))-mySize/3;
 			};
 		}
 		xPositionH[tracker] = myX + mySize/2;
 		yPositionH[tracker] = myY + mySize/2;
 	}

 }  
 class Bacteria    
 {     
 	double myX, myY, mySize;
 	int myColour;
 	Bacteria(double x, double y, double size, int colour){
 		myX = x;
 		myY = y;
 		mySize = size;
 		myColour = colour;
 	}  
 	void hide(){
 		stroke(255,255,255);
 		fill(255);
 		ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
 	}
 	void move(double x, double y){
 		if(x < myX && myX < sizeX - 100){
 			if(myX > sizeX/2){
 				myX = myX + (Math.random()*(mySize/2)-mySize*(myX/3000));
 			} else {
 				myX = myX + (Math.random()*(mySize/2))-mySize/5;
 			}
 		} else if(myX > 100){
 			if(myX < sizeX/2){
 				myX = myX + (Math.random()*(mySize/2)-mySize*(myX/1200));
 			} else {
 				myX = myX + (Math.random()*(mySize/2))-mySize/2;
 			};
 		}
 		if(y < myY && myY < sizeY - 100){
 			if(myY > sizeY/2){
 				myY = myY + (Math.random()*(mySize/2)-mySize*(myY/3000));
 			} else {
 				myY = myY + (Math.random()*(mySize/2))-mySize/5;
 			}
 		} else if(myY > 100) {
 			if(myY < sizeY/2){
 				myY = myY + (Math.random()*(mySize/2)-mySize*(myY/1200));
 			} else {
 				myY = myY + (Math.random()*(mySize/2))-mySize/2;
 			};
 		}
 		xPosition[tracker] = myX;
 		yPosition[tracker] = myY;

 	}
 	void show(){
 		stroke(myColour);
 		fill(myColour);
 		ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
 	}
 }  
