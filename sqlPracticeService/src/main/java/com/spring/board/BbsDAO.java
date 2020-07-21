package com.spring.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
public class BbsDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	Connection conn = null;
	PreparedStatement ppst = null;
	private ResultSet rs;
	// �̱���
	
	public BbsDAO() {
		try {String url = "jdbc:oracle:thin:@localhost:1521:xe";
		conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}


	public String getDate() {
		String SQL = "SELECT SYSDATE FROM dual;";
		try {
			
			PreparedStatement ppst = conn.prepareStatement(SQL);
			
			rs = ppst.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public int getNext() {
		String SQL = "SELECT bbsID from BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement ppst = conn.prepareStatement(SQL);
			rs = ppst.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return -1;
	}

	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES(?,?,?,SYSDATE,?,?)";
		try {
			PreparedStatement ppst = conn.prepareStatement(SQL);
			ppst.setInt(1, getNext());
			ppst.setString(2, bbsTitle);
			ppst.setString(3, userID);
			//ppst.setString(4, getDate());
			ppst.setString(4, bbsContent);
			ppst.setInt(5, 1);

			
			return ppst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	
	 public ArrayList<Bbs> getList(int pageNumber) {
		 String SQL = "SELECT * FROM (SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID ASC) WHERE ROWNUM < 10 ";
		 		
		 		ArrayList<Bbs> list = new ArrayList<Bbs>();
			try {
				PreparedStatement ppst = conn.prepareStatement(SQL);
				ppst.setInt(1, getNext()-(pageNumber-1)*10);
				rs = ppst.executeQuery();
				while(rs.next()) {
					Bbs bbs = new Bbs();
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setUserID(rs.getString(3));
					bbs.setBbsDate(rs.getString(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					list.add(bbs);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	 
	 public boolean nextPage(int pageNumber) {
		 String SQL = "SELECT * FROM (SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID ASC) WHERE ROWNUM < 10 ";
	 		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement ppst = conn.prepareStatement(SQL);
			ppst.setInt(1, getNext()-(pageNumber-1)*10);
			rs = ppst.executeQuery();
			if(rs.next()) {
				return true;
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	 public Bbs getBbs(int bbsID) {
			String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
			//String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
			try {
				PreparedStatement ppst = conn.prepareStatement(SQL);
				ppst.setInt(1, bbsID);
				rs = ppst.executeQuery();
				if (rs.next()) {
					Bbs bbs = new Bbs();
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setUserID(rs.getString(3));
					bbs.setBbsDate(rs.getString(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));

					return bbs;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;

		}
		
		//수정 함수
		public int update(int bbsID, String bbsTitle, String bbsContent) {
				String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
				try {
					PreparedStatement ppst = conn.prepareStatement(SQL);
					ppst.setString(1, bbsTitle);
					ppst.setString(2, bbsContent);
					ppst.setInt(3, bbsID);
					return ppst.executeUpdate();

				} catch (Exception e) {
					e.printStackTrace();
				}
				return -1; // 데이터베이스 오류
		}
		

		//삭제 함수
		public int delete(int bbsID) {
			String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
			try {
				PreparedStatement ppst = conn.prepareStatement(SQL);   
				ppst.setInt(1, bbsID);
				return ppst.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
		}

		
	}