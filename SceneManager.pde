import java.util.Stack;
import java.util.HashMap;

class SceneManager {

    private final HashMap<String, Scene> sceneMap;
    private Stack<Scene> scenes;

    public SceneManager () {
        sceneMap = new HashMap<String, Scene>();
        scenes = new Stack<Scene>();
    }

    public void addScene(String identifier, Scene scene){
        sceneMap.put(identifier, scene);
        if (scenes.size() == 0) {
            scenes.push(scene);
        }
    }

    public void addScene(Scene scene){
        addScene(scene.getName(), scene);
    }

    public void goToScene(String sceneName){
        if(sceneMap.containsKey(sceneName)){
            scenes.push(sceneMap.get(sceneName));
        } else {
            println("Scene not found with name: " + sceneName);
        }
    }

    public void goToPreviousScene(){
        scenes.pop();
    }

    public Scene getScene(String identifier){
        return sceneMap.get(identifier);
    }

    public Scene getCurrentScene(){
        return scenes.peek();
    }
}
