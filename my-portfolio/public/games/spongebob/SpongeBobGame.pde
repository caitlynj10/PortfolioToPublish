SpongeBob mySpongeBob = new SpongeBob(100, 700);
ArrayList<KrabbyPatties> rain = new ArrayList<KrabbyPatties>();
float pattieSpeed = 8;
boolean gameStarted = false;

void setup(){
    size(1000, 1000);
    rain.add(new KrabbyPatties());
}

void startGame(){
    background(146, 242, 245);
    fill(238, 242, 34);
    rect(400, 450, 200, 100, 28);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Start Game", 500, 500);
}
void mousePressed(){

    if(!gameStarted){
        if(mouseX > 400 && mouseX < 600 && mouseY > 450 && mouseY < 550){
            gameStarted = true;
        }
    }
}

void draw(){
    if(!gameStarted){
        startGame();
    }
    else{
        background(146, 242, 245);
        //Ground
        fill(4,4,72);
        rect(0,800,1000,200);
        //Bikini Bottom
        stroke(207, 101, 250);
        fill(207, 101, 250);
        rect(0, 300, 150, 500);
        arc(75, 300, 150, 150, PI, TWO_PI);
        rect(250, 500, 150, 300);
        arc(325, 500, 150, 150, PI, TWO_PI);
        rect(575, 400, 150, 400);
        arc(650, 400, 150, 150, PI, TWO_PI);
        rect(825, 100, 150, 700);
        arc(900, 100, 150, 150, PI, TWO_PI);
        stroke(0, 0, 0); 

        for (int i = 0; i < rain.length; i++) {
        rain.get(i).act();
        }
        
        mySpongeBob.act();

        textSize(20); // Set Text Size  
        fill(0, 0, 0); // Text color black 
        text("Score: ", 40, 20); // Print "Score" on canvas
        text(mySpongeBob.score, 100, 20); // Print player's score
        text("Level: ", 900, 20);
        text(mySpongeBob.level, 965, 20);
    }
    
}