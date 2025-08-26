package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.GetConn;

public class BoardDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	BoardVO vo = null;
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			} finally {
				pstmtClose();
			}
		}
	}
	// 게시글의 총 갯수.
	public int getTotRecCnt() {
		int res = 0;
		try {
			sql = "SELECT COUNT(*) AS cnt FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) res = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL에러.(getTotRecCnt)"+e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}
	// 게시글 목록 불러오기.
	public List<BoardVO> getBoardList(int startIndexNo, int pageSize) {
		List<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql = "SELECT * FROM board ORDER BY idx DESC LIMIT ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setHostIP(rs.getString("hostIP"));
				vo.setOpenSW(rs.getString("openSW"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
				vo.setwDate(rs.getString("wDate"));
				vo.setComplaint(rs.getString("complaint"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류.(getBoardList)"+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	// 게시글 등록.
	public int setBoardInputOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "INSERT INTO board VALUES(DEFAULT,?,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getHostIP());
			pstmt.setString(6, vo.getOpenSW());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류.(setBoardInputOk)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	public BoardVO getBoardContent(int idx) {
		try {
			sql = "SELECT * FROM board WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setHostIP(rs.getString("hostIP"));
				vo.setOpenSW(rs.getString("openSW"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
				vo.setwDate(rs.getString("wDate"));
				vo.setComplaint(rs.getString("complaint"));
			}
		} catch (SQLException e) {
			System.out.println("SQL에러.(getBoardContent)"+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	public void setBoardReadNumPlus(int idx) {
		try {
			sql = "UPDATE board SET readNum = readNum + 1 WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL에러.(setBoardReadNumPlus)"+e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	public int setBoardGoodCheck(int idx, int goodCnt) {
		int res = 0;
		try {
			sql = "UPDATE board SET good = good + ? WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodCnt);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL에러.(setBoardGoodCheck)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
}
