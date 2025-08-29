package PDS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.GetConn;

public class PDSDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	PDSVO vo = null;
	
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
			sql = "SELECT COUNT(*) AS cnt FROM PDS";
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
	public List<PDSVO> getPDSList(String part) {
		List<PDSVO> vos = new ArrayList<PDSVO>();
		try {
			if(part.equals("전체")) {
				sql = "SELECT *, timestampdiff(hour, fDate, now()) AS hourDiff, "
						+ "datediff(now(), fDate) AS dateDiff "
						+ "FROM pds ORDER BY idx DESC;";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "SELECT *, timestampdiff(hour, fDate, now()) AS hourDiff, "
						+ "datediff(now(), fDate) AS dateDiff "
						+ "FROM pds "
						+ "WHERE part = ? "
						+ "ORDER BY idx DESC;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, part);
			}
//			pstmt.setInt(1, startIndexNo);
//			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new PDSVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSize(rs.getString("fSize"));
				vo.setfsName(rs.getString("fsName"));
				vo.setPart(rs.getString("part"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setOpenSW(rs.getString("openSW"));
				vo.setPwd(rs.getString("pwd"));
				vo.setHostIP(rs.getString("hostIP"));
				vo.setDownNum(rs.getInt("downNum"));
				vo.setfDate(rs.getString("fDate"));
				
				vo.setHourDiff(rs.getInt("hourDiff"));
				vo.setDateDiff(rs.getInt("dateDiff"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류.(getPDSList)"+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	// 자료글 등록.
	public int setPDSInputOk(PDSVO vo) {
		int res = 0;
		try {
			sql = "INSERT INTO pds VALUES(DEFAULT,?,?,?,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getfName());
			pstmt.setString(4, vo.getfsName());
			pstmt.setString(5, vo.getfSize());
			pstmt.setString(6, vo.getPart());
			pstmt.setString(7, vo.getTitle());
			pstmt.setString(8, vo.getContent());
			pstmt.setString(9, vo.getOpenSW());
			pstmt.setString(10, vo.getPwd());
			pstmt.setString(11, vo.getHostIP());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류.(setPDSInputOk)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	// 게시글 내용 가져오기.
	public PDSVO getPDSContent(int idx) {
		try {
			sql = "SELECT * FROM pds WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new PDSVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setHostIP(rs.getString("hostIP"));
				vo.setOpenSW(rs.getString("openSW"));
				vo.setfDate(rs.getString("fDate"));
			}
		} catch (SQLException e) {
			System.out.println("SQL에러.(getPDSContent)"+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	// 게시글 조회수.
	public void setPDSReadNumPlus(int idx) {
		try {
			sql = "UPDATE pds SET readNum = readNum + 1 WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL에러.(setPDSReadNumPlus)"+e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	// 게시글 좋아요.
	public int setPDSGoodCheck(int idx, int goodCnt) {
		int res = 0;
		try {
			sql = "UPDATE pds SET good = good + ? WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodCnt);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL에러.(setPDSGoodCheck)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	// 게시글 삭제.
	public int setPDSDelete(int idx) {
		int res = 0;
		try {
			sql = "DELETE FROM pds WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류.(setPDSDelete)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	// 게시글 수정.
	public int setPDSUpdateOk(PDSVO vo) {
		int res = 0;
		try {
			sql = "UPDATE pds SET title = ?, content = ?, hostIP = ?, openSW = ?, fDate = now() WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getHostIP());
			pstmt.setString(4, vo.getOpenSW());
			pstmt.setInt(5, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL에러.(setPDSUpdateOk)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	// 이전글, 다음글
	public PDSVO getPreNextSearch(int idx, String str) {
		try {
			if(str.equals("preVO")) sql = "SELECT idx, title, openSW FROM pds WHERE idx < ? ORDER BY idx DESC limit 1";
			else sql = "SELECT idx, title, openSW FROM pds WHERE idx > ? ORDER BY idx limit 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new PDSVO();
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
	public List<PDSVO> getPDSSearchList(String search, String searchString) {
		List<PDSVO> vos = new ArrayList<PDSVO>();
		try {
			sql = "SELECT *, timestampdiff(hour, fDate, now()) AS hourDiff, datediff(now(), fDate) AS dateDiff "
					+ "FROM pds "
					+ "WHERE "+search+" like ? "
					+ "ORDER BY idx DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new PDSVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setHostIP(rs.getString("hostIP"));
				vo.setOpenSW(rs.getString("openSW"));
				vo.setfDate(rs.getString("fDate"));
				
				vo.setHourDiff(rs.getInt("hourDiff"));
				vo.setDateDiff(rs.getInt("dateDiff"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류.(getPDSSearchList)"+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	// 댓글 리스트
//	public List<PDSReplyVO> getPDSReplyList(int idx) {
//		List<PDSReplyVO> replyVOS = new ArrayList<PDSReplyVO>();
//		try {
//			sql = "SELECT * FROM PDSReply WHERE PDSIdx = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, idx);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				replyVO = new PDSReplyVO();
//				replyVO.setIdx(rs.getInt("idx"));
//				replyVO.setPDSIdx(rs.getInt("PDSIdx"));
//				replyVO.setMid(rs.getString("mid"));
//				replyVO.setNickName(rs.getString("nickName"));
//				replyVO.setContent(rs.getString("content"));
//				replyVO.setHostIP(rs.getString("hostIP"));
//				replyVO.setfDate(rs.getString("fDate"));
//				
//				replyVOS.add(replyVO);
//			}
//		} catch (SQLException e) {
//			System.out.println("SQL오류.(getPDSReplyList)"+e.getMessage());
//		} finally {
//			rsClose();
//		}
//		return replyVOS;
//	}
	// 댓글 입력 처리.
//	public int setReplyInputOk(PDSReplyVO replyVO) {
//		int res = 0;
//		try {
//			sql = "INSERT INTO PDSReply VALUES(DEFAULT, ?, ?, ?, ?, DEFAULT, ?)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, replyVO.getPDSIdx());
//			pstmt.setString(2, replyVO.getMid());
//			pstmt.setString(3, replyVO.getNickName());
//			pstmt.setString(4, replyVO.getContent());
//			pstmt.setString(5, replyVO.getHostIP());
//			res = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("SQL에러.(setReplyInputOk)"+e.getMessage());
//		} finally {
//			pstmtClose();
//		}
//		return res;
//	}
	// 댓글 삭제 처리.
	public int setReplyDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "DELETE FROM pdsReply WHERE idx = ?";
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
	public int setReplyUpdateOk(int replyIdx, String replyContent) {
		int res = 0;
		try {
			sql = "UPDATE pdsReply SET content = ? WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, replyContent);
			pstmt.setInt(2, replyIdx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL에러.(setReplyUpdateOk)"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
}
