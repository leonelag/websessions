<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@
    page import="java.util.Enumeration,
                 java.util.Iterator,
                 java.util.LinkedList"
%><%!
  Iterator fromEnumeration(Enumeration en) {
	LinkedList lst = new LinkedList();
	while (en.hasMoreElements()) {
	  lst.add(en.nextElement());
	}
	return lst.iterator();
  }
%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Things in session in Web2.</title>
</head>
<body style='background-color: green'>
  <h1>In your session in Web2</h1>
  <% Iterator attrs = fromEnumeration(session.getAttributeNames());
     if (!attrs.hasNext()) { %>
  <p>Session is empty.</p>
  <% } else { %>
       <ul><%
       while (attrs.hasNext()) {
         String attrName = (String) attrs.next();
         Object attr = session.getAttribute(attrName);
         %>
         <li><%= attrName %>: <%= attr %></li><%
       }
     }
     %></ul>

  <h2>Add something</h2>
  <form action="session" method="POST">
    <p>Name: <input type="text" name="name" /></p>
    <p>Value: <input type="text" name="value" /></p>
    <p><input type="submit" value="Send!"/></p>
  </form>
</body>
</html>