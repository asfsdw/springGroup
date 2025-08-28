package study2.login;

public class LoginPhotoVO {
	private int idx;
	private String originName;
	private String serverName;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getServerName() {
		return serverName;
	}
	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	@Override
	public String toString() {
		return "LoginPhotoVO [idx=" + idx + ", originName=" + originName + ", serverName=" + serverName + "]";
	}
}
