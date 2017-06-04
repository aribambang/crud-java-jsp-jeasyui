package general;

public abstract class dao {
	public abstract void close();
	final protected void finalize() throws Throwable{
		close();
	}
}