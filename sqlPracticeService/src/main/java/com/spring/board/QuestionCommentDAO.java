package com.spring.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.spring.board.util.DBConnector;

public class QuestionCommentDAO {
	private static QuestionCommentDAO single = null;

	private QuestionCommentDAO() {
	}

	public static QuestionCommentDAO getInstance() {
		if (single == null) {
			single = new QuestionCommentDAO();
		}

		return single;
	}

	public List<QuestionCommentDto> selectComments(String m_id, int prob_num, String qst_date) {
		List<QuestionCommentDto> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM QUESTION_COMMENT WHERE Q_ID =? AND PROB_NUM = ? AND QST_DATE = ?";

		try {
			conn = DBConnector.getInstance().getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			stmt.setInt(2, prob_num);
			stmt.setString(3, qst_date);
			rs = stmt.executeQuery();

			while (rs.next()) {
				QuestionCommentDto dto = new QuestionCommentDto(rs.getString("q_id"), rs.getString("qc_id"),
						rs.getInt("prob_num"), rs.getString("qst_date"), rs.getString("qc_date"),
						rs.getString("qc_body"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public int countComments(String m_id, int prob_num, String qst_date) {
		int count = 0;

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(QC_ID) AS NUM FROM QUESTION_COMMENT WHERE Q_ID =? AND PROB_NUM = ? AND QST_DATE = ? GROUP BY Q_ID, PROB_NUM, QST_DATE";

		try {
			conn = DBConnector.getInstance().getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			stmt.setInt(2, prob_num);
			stmt.setString(3, qst_date);
			rs = stmt.executeQuery();

			rs.next();
			count = rs.getInt("NUM");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (count != 0) {
			return count;
		}
		return 0;
	}

	public void insertComment(String q_id, String qc_id, int prob_num, String qst_date, String qc_body) {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "insert into question_comment values (?, ?, ?, ?, TO_CHAR(SYSDATE,'YY/MM/DD HH24:MI:SS'), ?)";

		try {
			conn = DBConnector.getInstance().getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, q_id);
			stmt.setString(2, qc_id);
			stmt.setInt(3, prob_num);
			stmt.setString(4, qst_date);
			stmt.setString(5, qc_body);
			stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public void deleteComment(String q_id, String qc_id, int prob_num, String qst_date, String qc_date,
			String qc_body) {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "delete from question_comment where q_id=? AND qc_id=? AND prob_num=? AND qst_date = ? AND qc_date = ?";

		try {
			conn = DBConnector.getInstance().getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, q_id);
			stmt.setString(2, qc_id);
			stmt.setInt(3, prob_num);
			stmt.setString(4, qst_date);
			stmt.setString(5, qc_date);
			stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
}
