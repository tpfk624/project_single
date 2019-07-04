package backup;

public class TempKey {
	private boolean lowerCheck;
	private int size;
	
	public TempKey(boolean lowerCheck, int size) {
		super();
		this.lowerCheck = lowerCheck;
		this.size = size;
	}
	public boolean isLowerCheck() {
		return lowerCheck;
	}
	public void setLowerCheck(boolean lowerCheck) {
		this.lowerCheck = lowerCheck;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
}
