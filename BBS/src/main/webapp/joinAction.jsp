 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ page import="user.UserDAO" %>  

 <%@ page import="java.io.PrintWriter" %>  
 <% request.setCharacterEncoding("UTF-8"); %> 

 <jsp:useBean id="user" class="user.User" scope="page" />
 <jsp:setProperty name = "user" property="userID" />
 <jsp:setProperty name = "user" property="userPassword" />
 <jsp:setProperty name = "user" property="userName" />
 <jsp:setProperty name = "user" property="userGender" />
 <jsp:setProperty name = "user" property="userEmail" />
 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과를 알려주는 페이지, 회원가입 시도를 처리하는 페이지</title>
<!-- UserDAO를 이용해서 로그인 작업을 처리하도록 -->
</head>
<body>
	
	
	<%  
		//회원가입시 공백값이 들어가지 않도록! 모든 경우의 수를 넣어준다.
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null ||
			user.getUserGender() == null || user.getUserEmail() == null) {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println( "alert ('입력이 안된 사항이 있습니다.') ");
			script.println( "history.back()" );			//입력이 안된 부분이 있다면 사용자가 다시 백하여 고칠 수 있도록 해준다.		
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO(); 	//데이터베이스에 접근할 수 있는 객체를 만들어준다.
			int result = userDAO.join(user);	//10~11번의 각각의 변수들을 다 입력받아 만들어진 하나의 user라는 인스턴스가 join함수를 수행하도록!매개변수로 들어감.
			
			if(result == -1) {		//데이터베이스 오류가 발생한 경우 = 즉, 해당 아이디가 이미 존재하는 경우를 말한다. 
									//userID는 pk키	= 즉, 하나만 존재하는 아이디여야만 한다. 
									//따라서, 동일한 아이디를 입력했을 경우, 데이터베이스 오류가 발생하며 -1을 반환한다.
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println( "alert ('이미 존재하는 아이디입니다.') ");
				script.println( "history.back()" );				
				script.println("</script>");
			}
			else {		//-1이 아닌 경우는 전부 다~ 여기가 실행되게끔
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println( "location.href= 'main.jsp' ");	//main.jsp로 이동한다. 회원가입이 되었을 경우, 바로 main.jsp로 가게끔! 
				script.println("</script>");
			}
		}
	%>
	
</body>
</html>