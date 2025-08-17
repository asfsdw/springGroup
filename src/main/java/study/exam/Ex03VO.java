package study.exam;

public class Ex03VO {
	private int hakbun;
	private int kor;
	private int eng;
	private int mat;
	private int sci;
	private int soc;
	private int tot;
	private double avr;
	private String grade;
	private int ranking;
	
	public int getHakbun() {
		return hakbun;
	}
	public void setHakbun(int hakbun) {
		this.hakbun = hakbun;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	public int getSci() {
		return sci;
	}
	public void setSci(int sci) {
		this.sci = sci;
	}
	public int getSoc() {
		return soc;
	}
	public void setSoc(int soc) {
		this.soc = soc;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public double getAvr() {
		return avr;
	}
	public void setAvr(double avr) {
		this.avr = avr;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	@Override
	public String toString() {
		return "Ex03VO [hakbun=" + hakbun + ", kor=" + kor + ", eng=" + eng + ", mat=" + mat + ", sci=" + sci + ", soc="
				+ soc + ", tot=" + tot + ", avr=" + avr + ", grade=" + grade + ", ranking=" + ranking + "]";
	}
}
