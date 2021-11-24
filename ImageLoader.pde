class ImageLoader {

    // Deze class is niet voor prodcutie ofzo.
    // ik probeer een overzicht te krijgen van hoe images beter kunnen worden geimplement

    PImage image;
    String fileName;
    int width;
    int height;
    int x;
    int y;

    public ImageLoader(String fileName, int width, int height, int x, int y){
        this.fileName = fileName;
        this.width = width;
        this.height = height;
        this.x = x;
        this.y = y;
        image = loadImage("img/" + fileName);
    }


}