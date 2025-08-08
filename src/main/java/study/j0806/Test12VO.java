package study.j0806;

public class Test12VO {
	private String name;
	private int age;
	private String gender;
	private String hobby;
	private String job;
	private String mountain;
	private String content;
	private String fileName;
	private String Address;
	
	public Test12VO() {
	}
	public Test12VO(String name, int age, String gender, String hobby, String job, String mountain, String content,
			String fileName, String address) {
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.hobby = hobby;
		this.job = job;
		this.mountain = mountain;
		this.content = content;
		this.fileName = fileName;
		Address = address;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getMountain() {
		return mountain;
	}
	public void setMountain(String mountain) {
		this.mountain = mountain;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}

	@Override
	public String toString() {
		return "Test12VO [name=" + name + ", age=" + age + ", gender=" + gender + ", hobby=" + hobby + ", job=" + job
				+ ", mountain=" + mountain + ", content=" + content + ", fileName=" + fileName + ", Address=" + Address + "]";
	}
}
