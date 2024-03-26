package exception;

public class LectureNotFoundException extends Exception{
	
	public LectureNotFoundException() {};
	public LectureNotFoundException(String msg) {
		super(msg);
	}

}
