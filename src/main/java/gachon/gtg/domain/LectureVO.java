package gachon.gtg.domain;

public class LectureVO {
	//private int lecnum;
	public String lecname;
	public String getLecname() {
		return lecname;
	}

	public void setLecname(String lecname) {
		this.lecname = lecname;
	}

	public String getLectime() {
		return lectime;
	}

	public void setLectime(String lectime) {
		this.lectime = lectime;
	}

	public int getLec_credit() {
		return lec_credit;
	}

	public void setLec_credit(int lec_credit) {
		this.lec_credit = lec_credit;
	}

	/*private char lectype;
	private int lecpeople;*/
	public String lectime;
	public int lec_credit;
	/*private char lecprof;
	private char lecroom;
	private char leclevel;*/
	
	public LectureVO(){
		this("","",0);
	}

	public LectureVO(String lecname, String lectime,int lec_credit) {
		// TODO Auto-generated constructor stub
		if (lecname==null)
			throw new IllegalArgumentException("lecture name must be input");
		if (lectime==null)
			throw new IllegalArgumentException("lecture time must be input");
		if (lectime==null)
			throw new IllegalArgumentException("lecture credit must be input");

		this.lecname=lecname;
		this.lectime=lectime;
		this.lec_credit=lec_credit;

	}


	
}