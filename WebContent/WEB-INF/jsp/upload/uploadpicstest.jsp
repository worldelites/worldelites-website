<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" name="defpic" id="defpic" />
<input type="text" name="defpicList" id="defpicList" />
  <iframe id="ifmupdo" name="ifmupdo"  src="<%=request.getContextPath()+"/upload/uploadpics.html"%>" frameborder="0" scrolling="no" width="310" height="255" style="background-color:#ffffff; margin:0; padding:0; margin-top:7px; margin-left:5px;"></iframe>
</body>
</html>