import processing.sound.*;

int width = 1920;
int height = 1080;

public SceneManager sceneManager;
public InventoryManager inventoryManager;

void settings(){
    fullScreen();
    setupScenes();
}

void draw(){
    background(255, 255, 255);
    sceneManager.getCurrentScene().draw(width, height);
    if(keyPressed){
        if(key == 'z' || key == 'Z'){
            sceneManager.getCurrentScene().startDialogue("1");
            println("click");
        }
    }
}

void setupScenes(){
    inventoryManager = new InventoryManager();
    sceneManager = new SceneManager();

    setupStartScreen();
    setupBedroom();
    setupLivingRoom();
    setupKitchen();
}

void setupStartScreen(){

    Scene startScreen = new Scene("startScreen", "img/characters/posterBoy.png");

    MoveToSceneObject startGame = new MoveToSceneObject("startGame", 50, 800, 100, 100, "img/pointers/arrowLeft.png", "kitchen");
    startScreen.addHUD(startGame);

    sceneManager.addScene(startScreen);

}

void setupBedroom(){
    Scene bedroom = new Scene("bedroom", "img/backgrounds/bedroom.png");

    MoveToSceneObject goToLivingRoom = new MoveToSceneObject("goToLivingRoom", 1800, 800, 100, 100, "img/pointers/arrowRight.png", "livingroom");
    bedroom.addHUD(goToLivingRoom);

    //GameObject garlic = new GameObject("garlic", 0, 0, 1280, 720, "img/objects/garlic.png");
    //bedroom.addGameObject(garlic);
    
    Dialogue firstDialogue = new Dialogue("1", "Boy", "img/characters/boy.png", "This is a test message to show that dialogues should work, not yet pretty tho");
    Dialogue secondDialogue = new Dialogue("2", "Boy", "img/characters/boy.png", "Second Dialogue, testing if this actually works");
    firstDialogue.setNextDialogue(secondDialogue);
    
    bedroom.addDialogue(firstDialogue);
    bedroom.addDialogue(secondDialogue);
    
    sceneManager.addScene(bedroom);
}

void setupLivingRoom(){
    Scene livingroom = new Scene("livingroom", "img/backgrounds/livingroom.png");

    MoveToSceneObject goToBedroom = new MoveToSceneObject("goToBedroom", 50, 800, 100, 100, "img/pointers/arrowLeft.png", "bedroom");
    livingroom.addHUD(goToBedroom);
    
    MoveToSceneObject goToKitchen = new MoveToSceneObject("goToKitchen", 1800, 800, 100, 100, "img/pointers/arrowRight.png", "kitchen");
    livingroom.addHUD(goToKitchen);

    livingroom.addDialogue(new Dialogue("1", "Boy", "img/characters/boy.png", "This is a test message to show that dialogues should work, not yet pretty tho"));
    
    sceneManager.addScene(livingroom);
}

void setupKitchen(){
    Scene kitchen = new Scene("kitchen", "img/backgrounds/kitchen.png");

    MoveToSceneObject goToLivingRoom = new MoveToSceneObject("goToLivingRoom", 50, 800, 100, 100, "img/pointers/arrowLeft.png", "livingroom");
    kitchen.addHUD(goToLivingRoom);

    kitchen.addDialogue(new Dialogue("1", "Boy", "img/characters/boy.png", "This is a test message to show that dialogues should work, not yet pretty tho"));
    
    sceneManager.addScene(kitchen);
}

@Override
void mouseClicked(){
    sceneManager.getCurrentScene().mouseClicked();
}

@Override
void mouseMoved(){
    sceneManager.getCurrentScene().mouseMoved();
}
