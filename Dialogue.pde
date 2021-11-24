class Dialogue {

    private String identifier;
    private String sentence;
    private String characterName;
    private String fileName;
    private boolean reversedPosition;

    private boolean active;
    private boolean skippable = false;

    private PImage image;
    private int x,y;
    
    private Timer timer;

    private PImage speechBubble = loadImage("img/ui/speechBubble2.png");

    private Dialogue nextDialogue;

    public Dialogue(String identifier, String characterName, String fileName, String sentence, boolean reversedPosition, int timer, Dialogue nextDialogue){
        this.identifier = identifier;
        this.characterName = characterName;
        this.fileName = fileName;
        this.sentence = sentence;
        this.reversedPosition = reversedPosition;
        this.nextDialogue = nextDialogue;
        image = loadImage(fileName);
        this.x = 200;
        this.y = height-image.height;
        this.timer = new Timer(timer);
    }

    public Dialogue(String identifier, String characterName, String fileName, String sentence, boolean reversedPosition, int timer){
        this(identifier, characterName, fileName, sentence, reversedPosition, timer, null);
    }

    public Dialogue(String identifier, String characterName, String fileName, String sentence, int timer, Dialogue nextDialogue){
        this(identifier, characterName, fileName, sentence, false, timer, nextDialogue);
    }

    public Dialogue(String identifier, String characterName, String fileName, String sentence, boolean reversedPosition){
        this(identifier, characterName, fileName, sentence, false, 2000, null);
    }

    public Dialogue(String identifier, String characterName, String fileName, String sentence, int timer){
        this(identifier, characterName, fileName, sentence, false, timer, null);
    }

    public Dialogue(String identifier, String characterName, String fileName, String sentence){
        this(identifier, characterName, fileName, sentence, false, 2000, null);
    }

    public Dialogue(){
        this("","", "", "", false, 2000, null);
    }

    public void activate(){
        if(active == false){
            active = true;
            timer.start();
        }
    }

    public void deactivate(){
        if(active == true){
            active = false;
            skippable = false;
        }
    }

    public void setIdentifier(String identifier){
        this.identifier = identifier;
    }

    public void setCharacterName(String characterName){
        this.characterName = characterName;
    }

    public void setFileName(String fileName){
        this.fileName = fileName;
    }

    public void setSentence(String sentence){
        this.sentence = sentence;
    }

    public void isReversedPosition(){
        this.reversedPosition = reversedPosition;
    }

    public String getIdentifier(){
        return identifier;
    }

    public String getCharacterName(){
        return characterName;
    }

    public String getFileName(){
        return fileName;
    }

    public String getSentence(){
        return sentence;
    }

    public boolean isActive(){
        return active;
    }

    public boolean isSkippable(){
        return skippable;
    }

    public boolean hasNextDialogue(){
        return nextDialogue != null;
    }

    public Dialogue getNextDialogue(){
        return (hasNextDialogue()) ? nextDialogue : null;
    }

    public void setNextDialogue(Dialogue nextDialogue){
        this.nextDialogue = nextDialogue;
    }

    public void draw(){
        if(active){
            if(timer.isDone()){
                skippable = true;
            }
            image(image, x, y);
            image(speechBubble, 150, 350, 1280, 720);
            textSize(32);
            text(sentence, 190, 850, 1200, 175);
            text(characterName, 190, 805); 
        }
    }
}