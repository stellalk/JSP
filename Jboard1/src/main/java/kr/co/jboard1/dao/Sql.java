package kr.co.jboard1.dao;

public class Sql {
	
	public static final String SELECT_COUNT_ARTICLE = "SELECT COUNT(*) FROM `JBOARD_ARTICLE`;";
	public static final String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `JBOARD_ARTICLE` AS a "
													+ "JOIN `JBOARD_USER` AS b "
													+ "ON a.uid = b.uid "
													+ "ORDER BY `seq` DESC "
													+ "LIMIT ?, 10;";
	
	public static final String INSERT_ARTICLE = "INSERT INTO `JBOARD_ARTICLE` SET "
													+ "`title`=?, "
													+ "`content`=?, "
													+ "`uid`=?, "
													+ "`regip`=?, "
													+ "`rdate`=NOW();";
}
