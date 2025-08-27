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
	BoardReplyVO replyVO = null;
	
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
			sql = "SELECT *, timestampdiff(hour, wDate, now()) AS hourDiff, datediff(now(), wDate) AS dateDiff FROM board ORDER BY idx DESC LIMIT ?,?;";
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
				
				vo.setHourDiff(rs.getInt("hourDiff"));
				vo.setDateDiff(rs.getInt("dateDiff"));
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
	// 게시글 내용 가져오기.
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
	// 게시글 조회수.
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
	// 게시글 좋아요.
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
	// 게시글 삭제.
	public int setBoardDelete(int idx) {
		int res = 0;
		try {
			sql = "DELETE FROM board WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류.(setBoardDelete)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	// 게시글 수정.
	public int setBoardUpdateOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "UPDATE board SET title = ?, content = ?, hostIP = ?, openSW = ?, wDate = now() WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getHostIP());
			pstmt.setString(4, vo.getOpenSW());
			pstmt.setInt(5, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL에러.(setBoardUpdateOk)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	// 이전글, 다음글
	public BoardVO getPreNextSearch(int idx, String str) {
		try {
			if(str.equals("preVO")) sql = "SELECT idx, title, openSW FROM board WHERE idx < ? ORDER BY idx DESC limit 1";
			else sql = "SELECT idx, title, openSW FROM board WHERE idx > ? ORDER BY idx limit 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setOpenSW(rs.getString("openSW"));
			}
		} catch (SQLException e) {
			System.out.println("SQL에러.(getPreNextSearch)"+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	public List<BoardVO> getBoardSearchList(String search, String searchString) {
		List<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql = "SELECT *, timestampdiff(hour, wDate, now()) AS hourDiff, datediff(now(), wDate) AS dateDiff "
					+ "FROM board "
					+ "WHERE "+search+" like ? "
					+ "ORDER BY idx DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
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
				
				vo.setHourDiff(rs.getInt("hourDiff"));
				vo.setDateDiff(rs.getInt("dateDiff"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류.(getBoardSearchList)"+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	// 댓글 리스트
	public List<BoardReplyVO> getBoardReplyList(int idx) {
		List<BoardReplyVO> replyVOS = new ArrayList<BoardReplyVO>();
		try {
			sql = "SELECT * FROM boardReply WHERE boardIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				replyVO = new BoardReplyVO();
				replyVO.setIdx(rs.getInt("idx"));
				replyVO.setBoardIdx(rs.getInt("boardIdx"));
				replyVO.setMid(rs.getString("mid"));
				replyVO.setNickName(rs.getString("nickName"));
				replyVO.setContent(rs.getString("content"));
				replyVO.setHostIP(rs.getString("hostIP"));
				replyVO.setwDate(rs.getString("wDate"));
				
				replyVOS.add(replyVO);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류.(getBoardReplyList)"+e.getMessage());
		} finally {
			rsClose();
		}
		return replyVOS;
	}
	// 댓글 입력 처리.
	public int setReplyInputOk(BoardReplyVO replyVO) {
		int res = 0;
		try {
			sql = "INSERT INTO boardReply VALUES(DEFAULT, ?, ?, ?, ?, DEFAULT, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyVO.getBoardIdx());
			pstmt.setString(2, replyVO.getMid());
			pstmt.setString(3, replyVO.getNickName());
			pstmt.setString(4, replyVO.getContent());
			pstmt.setString(5, replyVO.getHostIP());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL에러.(setReplyInputOk)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	// 댓글 삭제 처리.
	public int setReplyDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "DELETE FROM boardReply WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL에러.(setReplyDeleteOk)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
}
