  <%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//encoding
	request.setCharacterEncoding("utf-8");

	//retreiving 
	//Multipart Request(request, saved location, file max size, encoding, new DefaultFileRenamePolicy())
	String path = request.getServletContext().getRealPath("/file");
	int maxSize = 1024 * 1024 * 10; //10mb
	
	MultipartRequest mRequest = new MultipartRequest(request, 
													path, 
													maxSize, 
													"UTF-8", 
													new DefaultFileRenamePolicy());
	
	String title = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	String file = mRequest.getFilesystemName("file");
	String regip = request.getRemoteAddr();
	
	//session user info
	UserBean user = (UserBean) session.getAttribute("suser");
	String uid = user.getUid();
	
	//database
ArticleBean article = new ArticleBean();
	article.setTitle(title);
	article.setContent(content);
	article.setFile(file != null ? 1 : 0);
	article.setUid(uid);
	article.setRegip(regip);
	
	int seq = ArticleDao.getInstance().insertArticle(article);
	
	//if attached
	if(file != null){
		//set a file name
		int i = file.lastIndexOf(".");
		String ext = file.substring(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss_");
		String now = sdf.format(new Date());
		
		String newName = now+uid+ext;
		
		//edit the saved file's name(stream)
		File oldFile = new File(path+"/"+file);
		File newFile = new File(path+"/"+newName);
		oldFile.renameTo(newFile);
		
		//INSERT file table
		ArticleDao.getInstance().insertFile(seq, file, newName);
	}
	
	//redirect to list
	response.sendRedirect("/Jboard1/list.jsp");

%>