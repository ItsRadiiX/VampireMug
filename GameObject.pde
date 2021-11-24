class GameObject {

    public VampireMug instance;

    private final String identifier;
    protected int x,y,width,height;

    private final boolean hasImage;
    private final boolean hasHoverImage;

    private PImage image;
    private PImage hoverImage;

    protected boolean mouseIsHovering;

    public GameObject(String identifier, int x, int y, int width, int height){
        this(identifier, x, y, width, height, "", "");
    }

    public GameObject(String identifier, int x, int y, int width, int height, String imageFile){
        this(identifier, x, y, width, height, imageFile, "");
    }

    public GameObject(String identifier, int x, int y, int width, int height, String imageFile, String hoverImageFile){
        this.identifier = identifier;
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.hasImage = !imageFile.equals("");
        if (hasImage) {
            image = loadImage(imageFile);
        }
        hasHoverImage = !hoverImageFile.equals("");
        if (hasHoverImage) {
            hoverImage = loadImage(hoverImageFile);
        }
        mouseIsHovering = false;
    }

    public void setMovie(String movieName){
        movie = new Movie(instance, movieName);
        movie.loop();
    }
    
    public void draw() {
        if (hasImage) {
            if (mouseIsHovering && hasHoverImage) {
                image(hoverImage, x, y, width, height);
            } else {
                image(image, x, y, width, height);
            }
        }
    }

    public void mouseMoved() {
        mouseIsHovering = mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height;
    }

    public void mouseClicked() {
    }

    public String getIdentifier() {
        return identifier;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null || obj.getClass() != this.getClass()) {
            return false;
        }
        GameObject otherGameObject = (GameObject) obj;
        return otherGameObject.getIdentifier().equals(this.identifier);
    }

    @Override
    public int hashCode() {
        final int prime = 11;
        return prime * this.identifier.hashCode();
    }

}