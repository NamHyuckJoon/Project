package vo;

public class Notice_VO {

	int nSeq;
	String nTitle;
	String nWriter;
	String nReview;
	String nContext;
	String nTime;
	
	public int getnSeq() {
		return nSeq;
	}
	public void setnSeq(int nSeq) {
		this.nSeq = nSeq;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnWriter() {
		return nWriter;
	}
	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}
	public String getnReview() {
		return nReview;
	}
	public void setnReview(String nReview) {
		this.nReview = nReview;
	}
	public String getnContext() {
		return nContext;
	}
	public void setnContext(String nContext) {
		this.nContext = nContext;
	}
	public String getnTime() {
		return nTime;
	}
	public void setnTime(String nTime) {
		this.nTime = nTime;
	}
	public Notice_VO(int nSeq, String nTitle, String nWriter, String nReview, String nContext, String nTime) {
		super();
		this.nSeq = nSeq;
		this.nTitle = nTitle;
		this.nWriter = nWriter;
		this.nReview = nReview;
		this.nContext = nContext;
		this.nTime = nTime;
	}	
	
	
}
