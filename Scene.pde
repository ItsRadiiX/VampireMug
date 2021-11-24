import java.util.Map;

class Scene {

    private String name;
    private PImage backgroundImage;
    
    private ArrayList<GameObject> gameObjects;
    private ArrayList<GameObject> recentlyAddedGameObjects;
    private ArrayList<GameObject> markedGameObjects;

    private ArrayList<GameObject> hud;
    private boolean showHUD;

    private HashMap<String, Dialogue> dialogues;
    private boolean inDialogue;

    public Scene(String name, String backgroundImage) {
        this.name = name;
        this.backgroundImage = loadImage(backgroundImage);
        gameObjects = new ArrayList<GameObject>();
        hud = new ArrayList<GameObject>();
        recentlyAddedGameObjects = new ArrayList<GameObject>();
        markedGameObjects = new ArrayList<GameObject>();
        dialogues = new HashMap<String, Dialogue>();
        inDialogue = false;
        showHUD = true;
    }

    public void addDialogue(String identifier, Dialogue dialogue){
        dialogues.put(identifier, dialogue);
    }

    public void addDialogue(Dialogue dialogue){
        addDialogue(dialogue.getIdentifier(), dialogue);
    }

    public void startDialogue(String identifier){
        dialogues.get(identifier).activate();
        inDialogue = true;
        showHUD = false;
    }
    
    public void stopDialogue(String identifier){
        Dialogue d = dialogues.get(identifier);
        if (d.hasNextDialogue()) {
            Dialogue nextDialogue = d.getNextDialogue();
            nextDialogue.activate();
            d.deactivate();
        } else {
            d.deactivate();
            inDialogue = false;
            showHUD = true; 
        }
    }

    public void stopDialogue(Dialogue dialogue){
        stopDialogue(dialogue.getIdentifier());
    }

    public void addGameObject(GameObject object){
        recentlyAddedGameObjects.add(object);
    }

    public void addHUD(GameObject obj){
        hud.add(obj);
    }

    public void removeHUD(GameObject obj){
        hud.remove(obj);
    }

    public void removeGameObject(GameObject object){
        markedGameObjects.add(object);
    }
    
    public void updateScene(){   
        if(markedGameObjects.size() > 0) {
            gameObjects.removeAll(markedGameObjects);
            markedGameObjects = new ArrayList<GameObject>();
        }
        if(recentlyAddedGameObjects.size() > 0){
            gameObjects.addAll(recentlyAddedGameObjects);
            recentlyAddedGameObjects = new ArrayList<GameObject>();
        }
    }

    public void draw(int width, int height){
        image(backgroundImage, 0, 0, width, height);
        updateScene();
        for(GameObject obj : gameObjects){
            obj.draw();
        }
        if(inDialogue){
            for(Map.Entry me : dialogues.entrySet()){
                dialogues.get(me.getKey()).draw();
            }
        }
        if(showHUD){
            for(GameObject obj : hud){
                obj.draw();
            }
        }
    }

    public void mouseMoved(){
        if(inDialogue){
            
        } else {
            for(GameObject obj : gameObjects){
                obj.mouseMoved();
            }
            for(GameObject obj : hud){
                obj.mouseMoved();
            }
        }
    }

    public void mouseClicked(){
        if(inDialogue){
            for(Map.Entry me : dialogues.entrySet()){
                Dialogue d = dialogues.get(me.getKey());
                if(d.isActive() && d.isSkippable()){
                    stopDialogue(d);
                }
            }
        } else {
            for(GameObject obj : gameObjects){
                obj.mouseClicked();
            }
            for(GameObject obj : hud){
                obj.mouseClicked();
            }
        }
    }

    public String getName(){
        return name;
    }

    public ArrayList<GameObject> getGameObjects() {
        return gameObjects;
    }

    public ArrayList<GameObject> getMarkedGameObjects(){
        return markedGameObjects;
    }

    public ArrayList<GameObject> getRecentlyAddedGameObjects(){
        return recentlyAddedGameObjects;
    }

}