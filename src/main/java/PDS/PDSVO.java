package PDS;

public class PDSVO {
	private int idx;
	private String mid;
	private String nickName;
	private String fName;
	private int fSize;
	private String fsName;
	private String part;
	private String title;
	private String content;
	private String fDate;
	private String openSW;
	private String pwd;
	private String hostIP;
	private int downNum;
	
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
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public int getfSize() {
		return fSize;
	}
	public void setfSize(int fSize) {
		this.fSize = fSize;
	}
	public String getFsName() {
		return fsName;
	}
	public void setFsName(String fsName) {
		this.fsName = fsName;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
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
	public String getfDate() {
		return fDate;
	}
	public void setfDate(String fDate) {
		this.fDate = fDate;
	}
	public String getOpenSW() {
		return openSW;
	}
	public void setOpenSW(String openSW) {
		this.openSW = openSW;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getHostIP() {
		return hostIP;
	}
	public void setHostIP(String hostIP) {
		this.hostIP = hostIP;
	}
	public int getDownNum() {
		return downNum;
	}
	public void setDownNum(int downNum) {
		this.downNum = downNum;
	}

	@Override
	public String toString() {
		return "PDSVO [idx=" + idx + ", mid=" + mid + ", nickName=" + nickName + ", fName=" + fName + ", fSize=" + fSize
				+ ", fsName=" + fsName + ", part=" + part + ", title=" + title + ", content=" + content + ", fDate=" + fDate
				+ ", openSW=" + openSW + ", pwd=" + pwd + ", hostIP=" + hostIP + ", downNum=" + downNum + "]";
	}
}
