package board;

public class BoardVO {
	private int idx;
	private String mid;
	private String nickName;
	private String title;
	private String content;
	private String hostIP;
	private String openSW;
	private int readNum;
	private int good;
	private String wDate;
	private String complaint;
	
	private int hourDiff;	// 새글 알림을 위해 24시간인지 확인하기 위한 변수.
	private int dateDiff;	// 날짜 출력을 위해 0, 1, …출력.

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHostIP() {
		return hostIP;
	}
	public void setHostIP(String hostIP) {
		this.hostIP = hostIP;
	}
	public String getOpenSW() {
		return openSW;
	}
	public void setOpenSW(String openSW) {
		this.openSW = openSW;
	}
	public int getReadNum() {
		return readNum;
	}
	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public String getComplaint() {
		return complaint;
	}
	public void setComplaint(String complaint) {
		this.complaint = complaint;
	}
	public int getHourDiff() {
		return hourDiff;
	}
	public void setHourDiff(int hourDiff) {
		this.hourDiff = hourDiff;
	}
	public int getDateDiff() {
		return dateDiff;
	}
	public void setDateDiff(int dateDiff) {
		this.dateDiff = dateDiff;
	}

	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", mid=" + mid + ", nickName=" + nickName + ", title=" + title + ", content="
				+ content + ", hostIP=" + hostIP + ", openSW=" + openSW + ", readNum=" + readNum + ", good=" + good + ", wDate="
				+ wDate + ", complaint=" + complaint + ", hourDiff=" + hourDiff + ", dateDiff=" + dateDiff + "]";
	}
}
