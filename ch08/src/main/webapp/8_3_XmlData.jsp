<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8"%>
<%
		//XML(Extensible Markup Language)
		//	- slower parcing speed than JSON
		//	- user directly defines tags
	
	//create XML
	String xml = "<members>";
		   xml +=  "<member>";
		   xml +=  "<uid>a101</uid>";
		   xml +=  "<name>Stella Kim</name>";
		   xml +=  "<hp>010-1234-1111</hp>";
		   xml +=  "<pos>deputy manager</pos>";
		   xml +=  "</member>";
		   xml +=  "<member>";
		   xml +=  "<uid>a102</uid>";
		   xml +=  "<name>Json Clark</name>";
		   xml +=  "<hp>010-1234-2222</hp>";
		   xml +=  "<pos>associate</pos>";
		   xml +=  "</member>";
		   xml +=  "</members>";

	//print XML
	out.print(xml);
%>