package study2.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

@SuppressWarnings({ "rawtypes", "unchecked" })
public class LoginDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	LoginVO vo = null;
	
	public LoginDAO() {
		String url = "jdbc:mysql://localhost:3306/springgroup";
		String user = "root", password = "1234";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버를 찾을 수 없습니다."+e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스에 접속할 수 없습니다."+e.getMessage());
		}
	}
	
	public void connClose() {
		if(conn != null) {
			try { conn.close();
			} catch (SQLException e) {}
		}
	}
	public void pstmtClose() {
		if(pstmt != null) {
			try { pstmt.close();
			} catch (SQLException e) {}
		}
	}
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {}
		}
	}

	// 로그인을 위한 아이디 체크.
	public LoginVO getLoginIDCheck(String mid) {
		vo = new LoginVO();
		try {
			sql = "SELECT * FROM friend WHERE mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(getLoginIDCheck)."+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 아이디 중복검사.
	public boolean getLoginJoinIDCheck(String mid, String nickName) {
		boolean tf = false;
		try {
			sql = "SELECT * FROM friend WHERE mid=? OR nickName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, nickName);
			rs = pstmt.executeQuery();
			// 검색결과가 있으면(중복이면) true 반환
			if(rs.next()) tf = true;
		} catch (SQLException e) {
			System.out.println("SQL오류."+e.getMessage());
		} finally {
			rsClose();
		}
		return tf;
	}
	
	// 닉네임 중복검사.
	public LoginVO getLoginNickCheck(String nickName) {
		vo = new LoginVO();
		try {
			sql = "SELECT * FROM friend WHERE nickName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(getLoginNickCheck)."+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 회원 정보입력.
	public int getLoginJoin(String mid, String pwd, String nickName, String name, int age, String gender, String address) {
		int res = 0;
		try {
			sql = "INSERT INTO friend VALUES (DEFAULT, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			pstmt.setString(3, nickName);
			pstmt.setString(4, name);
			pstmt.setInt(5, age);
			pstmt.setString(6, gender);
			pstmt.setString(7, address);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류(getLoginJoin)."+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 회원가입.
	public int setLoginJoinOk(LoginVO vo) {
		int res = 0;
		try {
			sql = "insert into friend values (default,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setInt(5, vo.getAge());
			pstmt.setString(6, vo.getGender());
			pstmt.setString(7, vo.getAddress());
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL오류(setLoginJoinOk)~~" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 회원 리스트.
	public List<LoginVO> getLoginList() {
		List<LoginVO> vos = new ArrayList<LoginVO>();
		try {
			sql = "SELECT * FROM friend ORDER BY idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new LoginVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(getLoginList)."+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 회원 수정.
	public int setMemberUpdate(String mid, String update, String updateValue) {
		int res = 0;
		try {
			// 컬럼명은 pstmt.setString 불가능해서 직접 변수 삽입
			sql = "UPDATE friend SET "+update+" = ? WHERE mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateValue);
			pstmt.setString(2, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류(setMemberUpdata)."+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 회원 리스트 Vector.
	public Vector getLoginListVData() {
		Vector vData = new Vector();
		try {
			sql = "SELECT * FROM friend ORDER BY idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Vector vo = new Vector();
				vo.add(rs.getInt("idx"));
				vo.add(rs.getString("mid"));
				vo.add(rs.getString("nickName"));
				vo.add(rs.getString("name"));
				vo.add(rs.getInt("age"));
				vo.add(rs.getString("gender"));
				vo.add(rs.getString("address"));
				vData.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(getLoginListVData)."+e.getMessage());
		} finally {
			rsClose();
		}
		return vData;
	}

	// 회원정보 수정.
	public int setLoginUpdate(LoginVO vo) {
		int res = 0;
		try {
			sql = "UPDATE friend SET name = ?, age = ?, gender = ?, address = ? WHERE mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getAge());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getMid());
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL오류(setLoginJoinOk)~~" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public int setFriendDelete(String mid) {
		int res = 0;
		try {
			System.out.println(mid);
			sql = "DELETE FROM friend WHERE mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("SQL오류.(setFriendDelete)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
}
