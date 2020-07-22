package com.spring.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.spring.board.util.DBConnector;

public class QuestionDAO {
	private static QuestionDAO single = null;

	private QuestionDAO() {
	}

	public static QuestionDAO getInstance() {
		if (single == null) {
			single = new QuestionDAO();
		}

		return single;
	}

	public List<QuestionDto> selectAll() {
		List<QuestionDto> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from question order by qst_date desc";

		try {
			conn = DBConnector.getInstance().getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				QuestionDto dto = new QuestionDto(rs.getString("m_id"), rs.getInt("prob_num"), rs.getString("qst_date"),
						rs.getString("qst_body"), rs.getString("qst_title"));
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

	public QuestionDto selectQuestion(String m_id, int prob_num, String qst_date) {
		QuestionDto dto = null;

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from question where m_id = ? and prob_num=? and qst_date = ?";

		try {
			conn = DBConnector.getInstance().getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			stmt.setInt(2, prob_num);
			stmt.setString(3, qst_date);
			rs = stmt.executeQuery();

			rs.next();
			dto = new QuestionDto(rs.getString("m_id"), rs.getInt("prob_num"), rs.getString("qst_date"),
					rs.getString("qst_body"), rs.getString("qst_title"));

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
		return dto;
	}

	public void updateQuestion(String m_id, int prob_num, String qst_date, String qst_title,
			String qst_body) {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "update question set qst_title=?, qst_body=? where m_id=? AND prob_num=? AND qst_date=?";

		try {
			conn = DBConnector.getInstance().getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, qst_title);
			stmt.setString(2, qst_body);
			stmt.setString(3, m_id);
			stmt.setInt(4, prob_num);
			stmt.setString(5, qst_date);
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

	public void deleteQuestion(String m_id, int prob_num, String qst_date) {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "delete from question where m_id=? AND prob_num=? AND qst_date=?";

		try {
			conn = DBConnector.getInstance().getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			stmt.setInt(2, prob_num);
			stmt.setString(3, qst_date);
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

	public void insertQuestion(String m_id, int prob_num, String qst_body, String qst_title) {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "insert into question values (?, ?, TO_CHAR(SYSDATE,'YY/MM/DD HH24:MI:SS'), ?, ?)";

		try {
			conn = DBConnector.getInstance().getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			stmt.setInt(2, prob_num);
			stmt.setString(3, qst_body);
			stmt.setString(4, qst_title);
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
