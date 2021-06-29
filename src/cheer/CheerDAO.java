package cheer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CheerDAO {

	private Connection conn;
	private ResultSet rs;
	
	public CheerDAO() {
		try {
//			String dbURL = "jdbc:mysql://localhost:3306/uaenafanpage";
			String dbURL = "jdbc:mysql://localhost/ancjf0601";
			String dbID = "ancjf0601";
			String dbPassword = "ancjf0601@";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int getNext() {
		String SQL = "SELECT cheerID FROM CHEER ORDER BY cheerID DESC";	//마지막에 쓰인 글 번호 가져옴
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1; //불러온 총 게시글 수 + 1
			}
			return 1;	//첫번째 게시물
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
	
	public int write(String userID, String cheerContent) {
		String SQL = "INSERT INTO CHEER VALUES (?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, cheerContent);
			pstmt.setInt(4, 1);	//Available자리
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
	
	public ArrayList<Cheer> getList(int pageNumber2){	//게시글 가져오기
		String SQL = "SELECT * FROM CHEER WHERE cheerID < ? AND cheerAvailable = 1 ORDER BY cheerID DESC LIMIT 15"; //available 1(삭제안된것) 중에 15개 불러옴
		ArrayList<Cheer> list = new ArrayList<Cheer>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber2 - 1) * 15);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Cheer cheer = new Cheer();
				cheer.setCheerID(rs.getInt(1));
				cheer.setUserID(rs.getString(2));
				cheer.setCheerContent(rs.getString(3));
				cheer.setCheerAvailable(rs.getInt(4));
				list.add(cheer); //cheer에 정보 담기 (List로)
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber2) {	//페이징 처리위한 함수
		String SQL = "SELECT * FROM CHEER WHERE cheerID < ? AND cheerAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber2 - 1) * 15);
			rs = pstmt.executeQuery();
			if(rs.next()) {	//결과가 존재한다면
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;		//결과가 존재하지 않는다면
	}
	
	public Cheer getCheer(int cheerID) {
		String SQL = "SELECT * FROM CHEER WHERE cheerID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cheerID);
			rs = pstmt.executeQuery();
			if(rs.next()) {	//결과가 존재한다면
				Cheer cheer = new Cheer();
				cheer.setCheerID(rs.getInt(1));
				cheer.setUserID(rs.getString(2));
				cheer.setCheerContent(rs.getString(3));
				cheer.setCheerAvailable(rs.getInt(4));
				return cheer;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;		//결과가 존재하지 않는다면
	}
	
	public int update(int cheerID, String cheerContent) {
		String SQL = "UPDATE CHEER SET cheerContent = ? WHERE cheerID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cheerContent);
			pstmt.setInt(2, cheerID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
	
	public int delete(int cheerID) {
		String SQL = "UPDATE CHEER SET cheerAvailable = 0 WHERE cheerID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cheerID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
}
