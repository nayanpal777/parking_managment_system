<%
	response.addHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	
	HttpSession httpSession=request.getSession(false);
	if(httpSession==null){
		response.sendRedirect("../index.html");
		return;
	}else{
		String email=(String)httpSession.getAttribute("USER_EMAIL");
		if(email == null){
			response.sendRedirect("../index.html");
			return;
		}
	}
%>