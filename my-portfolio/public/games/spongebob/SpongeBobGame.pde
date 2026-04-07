SpongeBob mySpongeBob = new SpongeBob(400, 500);
KrabbyPatties rain [] = new KrabbyPatties [5];

void setup(){
    size(800, 800);
    for (int i = 0; i < rain.length; i++) {
        rain [i] = new KrabbyPatties();
    }
}

void draw(){
    background(146, 242, 245);
    //Ground
    fill(4,4,72);
    rect(0,600,800,200);
    //Bikini Bottom
    stroke(207, 101, 250);
    fill(207, 101, 250); 
    rect(10, 250, 150, 350);
    arc(85, 250, 150, 150, PI, TWO_PI);
    rect(220, 450, 150, 150);
    arc(295, 450, 150, 150, PI, TWO_PI);
    rect(430, 300, 150, 300);
    arc(505, 300, 150, 150, PI, TWO_PI);
    rect(640, 150, 150, 450);
    arc(715, 150, 150, 150, PI, TWO_PI);
    stroke(0, 0, 0);  

    for (int i = 0; i < rain.length; i++) {
    rain[i].act();
  }
    
    mySpongeBob.act();

    textSize(20); // Set Text Size  
    fill(0, 0, 0); // Text color black 
    text("Score: ", 20, 20); // Print "Score" on canvas
    text(mySpongeBob.score, 100, 20); // Print player's score
    text("Level: ", 700, 20);
    text(mySpongeBob.level, 780, 20);
}