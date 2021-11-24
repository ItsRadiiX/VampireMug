import java.util.HashMap;

class InventoryManager {

	private final ArrayList<Collectable> collectables;
	private ArrayList<Collectable> markedCollectables;

	public InventoryManager() {
		collectables = new ArrayList<Collectable>();
		markedCollectables = new ArrayList<Collectable>();
	}

	public void addCollectable(Collectable collectable) {
		collectables.add(collectable);
	}

	public void removeCollectable(Collectable collectable) {
		markedCollectables.add(collectable);
	}

	public boolean containsCollectable(Collectable collectable) {
		return collectables.contains(collectable);
	}

	public void clearMarkedCollectables() {
		if (!markedCollectables.isEmpty()) {
			collectables.removeAll(markedCollectables);
			markedCollectables = new ArrayList<Collectable>();
		}
	}

}