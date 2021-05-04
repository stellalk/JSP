<%@page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sub1.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<% 
	//database
	String host = "jdbc:mysql://18.220.30.100:3306/kye";
	String user = "kye";
	String pass = "1234";
	
	//1
	Class.forName("com.mysql.jdbc.Driver");
	
	//2
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	//3
	Statement stmt = conn.createStatement();
	
	//4
	String sql = "SELECT * FROM `MEMBER`";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5
	List<MemberBean> mbList = new ArrayList<>();
	
	while(rs.next()){
		MemberBean mb = new MemberBean();
		
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
		
		mbList.add(mb);
	}
	
	//6
	rs.close();
	stmt.close();
	conn.close();

	//xml data(jdom library) - org.jdom2
	Document doc = new Document();
	Element members = new Element("members");
	
	for(MemberBean mb : mbList){
		Element member = new Element("member");
		Element uid = new Element("uid");
		Element name = new Element("name");
		Element hp = new Element("hp");
		Element pos = new Element("pos");
		Element dep = new Element("dep");
		Element rdate = new Element("rdate");
		
		//dep: change int to String
		uid.setText(mb.getUid());
		name.setText(mb.getName());
		hp.setText(mb.getHp());
		pos.setText(mb.getPos());
		dep.setText(""+mb.getDep());
		rdate.setText(mb.getRdate());

		//add individual tags into member tag
		member.addContent(uid);
		member.addContent(name);
		member.addContent(hp);
		member.addContent(pos);
		member.addContent(dep);
		member.addContent(rdate);
		
		members.addContent(member);
	}
	
	doc.setRootElement(members);
	
	//print xml
	XMLOutputter outPutter = new XMLOutputter(Format.getPrettyFormat());
	String xml = outPutter.outputString(doc);
	out.print(xml);
	
	
%>