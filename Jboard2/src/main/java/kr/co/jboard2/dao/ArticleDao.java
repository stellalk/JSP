package kr.co.jboard2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.jboard2.config.DBConfig;
import kr.co.jboard2.config.Sql;
import kr.co.jboard2.vo.ArticleVo;
import kr.co.jboard2.vo.FileVo;

public class ArticleDao {
	
	private static ArticleDao instance = new ArticleDao();
	private ArticleDao() {}
	
	public static ArticleDao getInstance() {
		return instance;
	}
	
	public FileVo selectFile(String seq) {
		
		FileVo vo = new FileVo();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_FILE);
			psmt.setString(1, seq);
			
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setSeq(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setOldName(rs.getString(3));
				vo.setNewName(rs.getString(4));
				vo.setDownload(rs.getInt(5));
				vo.setRdate(rs.getString(5));
			}
			
			rs.close();
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public int selectCountArticle() {
		int total = 0;
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(Sql.SELECT_COUNT_ARTICLE);
			
			if(rs.next()){
				total = rs.getInt(1);
			}
			
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e){
			e.printStackTrace();
		}
		return total;
	}
	
	public int selectMaxSeq() {
		
		int seq = 0;
		
		try {
			//database 1,2
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3
			Statement stmt = conn.createStatement();
			
			//4
			ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_SEQ);
			
			//5
			if(rs.next()) {
				seq = rs.getInt(1);
			}
			
			//6
			rs.close();
			stmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return seq;
	}
	
	public int insertArticle(ArticleVo article) {
		try {
			//database 1,2
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3
		    PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			psmt.setString(1, article.getTitle());
			psmt.setString(2, article.getContent());
			psmt.setInt(3, article.getFile());
			psmt.setString(4, article.getUid());
			psmt.setString(5, article.getRegip());
			
			//4
			psmt.executeUpdate();
			
			//6
			psmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		//get seq num inserted
		int seq = selectMaxSeq();
		
		return seq;
	}
	
	public void insertComment(String parent, String content, String uid, String regip) {
		try {
			//1,2
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_COMMENT);
			psmt.setString(1, parent);
			psmt.setString(2, content);
			psmt.setString(3, uid);
			psmt.setString(4, regip);
			
			//4
			psmt.executeUpdate();
			
			//6
			psmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertFile(int parent, String oldName, String newName) {
		try {
			//1,2
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, parent);
			psmt.setString(2, oldName);
			psmt.setString(3, newName);
			
			//4
			psmt.executeUpdate();
			
			//6
			psmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArticleVo selectArticle(String seq) {	
		ArticleVo ab = new ArticleVo();
		try {
		
			//1,2
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, seq);
			
			//4
			ResultSet rs = psmt.executeQuery();
			
			//5
			FileVo fb = new FileVo();
			
			if(rs.next()) {
				ab.setSeq(rs.getInt(1));
				ab.setParent(rs.getInt(2));
				ab.setComment(rs.getInt(3));
				ab.setCate(rs.getString(4));
				ab.setTitle(rs.getString(5));
				ab.setContent(rs.getString(6));
				ab.setFile(rs.getInt(7));
				ab.setHit(rs.getInt(8));
				ab.setUid(rs.getString(9));
				ab.setRegip(rs.getString(10));
				ab.setRdate(rs.getString(11));
				
				fb.setSeq(rs.getInt(12));
				fb.setParent(rs.getInt(13));
				fb.setOldName(rs.getString(14));
				fb.setNewName(rs.getString(15));
				fb.setDownload(rs.getInt(16));
				fb.setRdate(rs.getString(17));
				
				ab.setFb(fb);
			}
			
			//6
			rs.close();
			psmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ab;
	}
	
	public List<ArticleVo> selectArticles(int start) {
		List<ArticleVo> articles = new ArrayList<>();
		
		try {
			//database
			Connection conn = DBConfig.getInstance().getConnection();
				   
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setInt(1, start);
	
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()){
				ArticleVo ab = new ArticleVo();
				ab.setSeq(rs.getInt(1));
				ab.setParent(rs.getInt(2));
				ab.setComment(rs.getInt(3));
				ab.setCate(rs.getString(4));
				ab.setTitle(rs.getString(5));
				ab.setContent(rs.getString(6));
				ab.setFile(rs.getInt(7));
				ab.setHit(rs.getInt(8));
				ab.setUid(rs.getString(9));
				ab.setRegip(rs.getString(10));
				ab.setRdate(rs.getString(11));
				ab.setNick(rs.getString(12));
				
				articles.add(ab);		
			}
			rs.close();
			psmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		return articles;
	}
	
	public List<ArticleVo> selectComments(String parent) throws Exception{
		//database 1,2
		Connection conn = DBConfig.getInstance().getConnection();
		
		//3
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
		psmt.setString(1, parent);
		
		//4
		ResultSet rs = psmt.executeQuery();
		
		//5
		List<ArticleVo> comments = new ArrayList<>();
		while(rs.next()) {
			ArticleVo ab = new ArticleVo();
			ab.setSeq(rs.getInt(1));
			ab.setParent(rs.getInt(2));
			ab.setComment(rs.getInt(3));
			ab.setCate(rs.getString(4));
			ab.setTitle(rs.getString(5));
			ab.setContent(rs.getString(6));
			ab.setFile(rs.getInt(7));
			ab.setHit(rs.getInt(8));
			ab.setUid(rs.getString(9));
			ab.setRegip(rs.getString(10));
			ab.setRdate(rs.getString(11));
			ab.setNick(rs.getString(12));
			
			comments.add(ab);		
		}
		
		//6
		rs.close();
		psmt.close();
		conn.close();
		
		return comments;
	}
	
	public void updateFileDownload(String seq) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_FILE_DOWNLOAD);
			psmt.setString(1, seq);
			psmt.executeUpdate();
			psmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateArticle() throws Exception {}
	
	public void updateArticleHit(String seq) throws Exception {
		//database 1,2
		Connection conn = DBConfig.getInstance().getConnection();
		
		//3
		PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
		psmt.setString(1, seq);
		
		//4
		psmt.executeUpdate();
		
		//6
		psmt.close();
		conn.close();
	}
	
	public void updateArticleCommentInc(String seq) {
		try {
			//database 1,2
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_INC);
			psmt.setString(1, seq);
			
			//4
			psmt.executeUpdate();
			
			//6
			psmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateArticleCommentDec(String seq) throws Exception {
		//database 1,2
		Connection conn = DBConfig.getInstance().getConnection();
		
		//3
		PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_DEC);
		psmt.setString(1, seq);
		
		//4
		psmt.executeUpdate();
		
		//6
		psmt.close();
		conn.close();
	}
	
	public void deleteArticle() throws Exception {}
	
	public void deleteComment(String seq) throws Exception {
		//database 1,2
		Connection conn = DBConfig.getInstance().getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_COMMENT);
		psmt.setString(1, seq);
		
		//4
		psmt.executeUpdate();
		
		//6
		psmt.close();
		conn.close();
	}
	
}
