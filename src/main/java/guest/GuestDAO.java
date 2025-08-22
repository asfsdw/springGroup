package guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.GetConn;

public class GuestDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	GuestVO vo = null;
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.cancel();
			} catch (SQLException e) {}
		}
	}
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {pstmtClose();}
		}
	}
	// 방명록 목록
	public List<GuestVO> getGuestList() {
		List<GuestVO> vos = new ArrayList<GuestVO>();
		try {
			sql = "SELECT * FROM guest ORDER BY idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setContent(rs.getString("content"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setvDate(rs.getString("vDate"));
				vo.setHostIP(rs.getString("hostIP"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL에러.(getGuestList)"+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	// 방명록 등록
	public int setGuestInputOk(GuestVO vo) {
		int res = 0;
		try {
			sql = "INSERT INTO guest VALUES(DEFAULT, ?, ?, ?, ?, DEFAULT, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getHomePage());
			pstmt.setString(5, vo.getHostIP());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL에러.(setGuestInputOk)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	// 방명록 삭제
	public int setGuestDelete(int idx) {
		int res = 0;
		try {
			sql = "DELETE FROM guest WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL에러.(setGuestDelete)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
}
