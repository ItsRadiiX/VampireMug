class Collectable {
	private final String name;
	private final String imageFile;

	public Collectable(String name, String imageFile) {
		this.name = name;
		this.imageFile = imageFile;
	}

	public String getName() {
		return name;
	}

	public String getImageFile() {
		return imageFile;
	}
}