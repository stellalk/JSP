package kr.co.jboard2.config;

public class Sql {
	//UserDao
	public static final String SELECT_TERMS = "SELECT * FROM `JBOARD_TERMS`;";
	public static final String SELECT_USER  = "SELECT * FROM `JBOARD_USER` WHERE `uid`=? AND `pass`=PASSWORD(?);";
	public static final String INSERT_USER  = "INSERT INTO `JBOARD_USER` SET "
											   + "`uid`=?,"
											   + "`pass`=PASSWORD(?),"
											   + "`name`=?,"
											   + "`nick`=?,"
											   + "`email`=?,"
											   + "`hp`=?,"
											   + "`zip`=?,"
											   + "`addr1`=?,"
											   + "`addr2`=?,"
											   + "`regip`=?,"
											   + "`rdate`=NOW();";
	
	//ArticleDao
	public static final String SELECT_COUNT_ARTICLE = "SELECT COUNT(*) FROM `JBOARD_ARTICLE` WHERE `parent`=0;";
	public static final String SELECT_MAX_SEQ = "SELECT MAX(`seq`) FROM `JBOARD_ARTICLE` WHERE `parent`=0;";
	
	public static final String SELECT_ARTICLE = "SELECT * FROM `JBOARD_ARTICLE` AS a "
													+ "LEFT JOIN `JBOARD_FILE` AS b "
													+ "ON a.seq = b.parent "
													+ "WHERE a.seq=?;";
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `JBOARD_ARTICLE` AS a "
													+ "JOIN `JBOARD_USER` AS b "
													+ "ON a.uid = b.uid "
													+ "WHERE `parent`=0 "
													+ "ORDER BY `seq` DESC "
													+ "LIMIT ?, 10;";
	
	public static final String SELECT_COMMENTS = "SELECT a.*, b.nick FROM `JBOARD_ARTICLE` AS a "
													+ "JOIN `JBOARD_USER` AS b "
													+ "ON a.uid = b.uid "
													+ "WHERE `parent`=? "
													+ "ORDER BY `seq`";
	
	public static final String INSERT_ARTICLE = "INSERT INTO `JBOARD_ARTICLE` SET "
													+ "`title`=?, "
													+ "`content`=?, "
													+ "`file`=?, "
													+ "`uid`=?, "
													+ "`regip`=?, "
													+ "`rdate`=NOW();";
	
	public static final String INSERT_COMMENT = "INSERT INTO `JBOARD_ARTICLE` SET "
													+ "`parent`=?,"
													+ "`content`=?,"
													+ "`uid`=?,"
													+ "`regip`=?,"
													+ "`rdate`=NOW();";
	public static final String INSERT_FILE = "INSERT INTO `JBOARD_FILE` SET "
													+ "`parent`=?,"
													+ "`oldName`=?,"
													+ "`newName`=?,"
													+ "`rdate`=NOW()";
	
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `JBOARD_ARTICLE` SET `hit` = `hit` + 1 WHERE `seq` = ?;";
	public static final String UPDATE_ARTICLE_COMMENT_INC = "UPDATE `JBOARD_ARTICLE` SET `comment` = `comment` + 1 WHERE `seq` = ?;";
	public static final String UPDATE_ARTICLE_COMMENT_DEC = "UPDATE `JBOARD_ARTICLE` SET `comment` = `comment` - 1 WHERE `seq` = ?;";
	
	public static final String DELETE_COMMENT = "DELETE FROM `JBOARD_ARTICLE` WHERE `seq`=?;";
}