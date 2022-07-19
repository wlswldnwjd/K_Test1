 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

									<!-- 만들 클래스 가져오기 -->    
 <%@ page import="user.UserDAO" %>   <!-- 만든 클래스 사용을 위해 page import 한 후, user패키지-UserDAO를 불러온다 --> 

 <%@ page import="java.io.PrintWriter" %>  <!-- 자바스크립트 사용위해 작성하는 것 -->
 <% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8로 받을 수 있도록 설정 -->

 <!--  자바빈즈 활용 : 한명의 회원 정보를 담는 유저라는 클래스를 자바 빈즈로써 사용하는 것 -->
 <jsp:useBean id="user" class="user.User" scope="page" />
 <!-- jsp:useBean 을 써서 자바 빈즈를 사용한다는 걸 알려주고, scope="page"를 함으로써 현재 페이지 안에서만 빈즈가 사용될 수 있도록 한다.  -->
 
 <!-- login.jsp 페이지에서 넘겨준 이 유저로 id라는 것을 받아서 한명의 사용자의 userID에 넣어주는 것 -->
 <jsp:setProperty name = "user" property="userID" />
 <!-- 위와 마찬가지로 패스워드도 넣어준다. -->
 <jsp:setProperty name = "user" property="userPassword" />
 <!-- 이렇게 하면 이 페이지 안에 login.jsp페이지에서 넘어온 userID와 userPassword가 그대로 담기게 되는 것! -->
 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과를 알려주는 페이지, 로그인 시도를 처리하는 페이지</title>
<!-- UserDAO를 이용해서 로그인 작업을 처리하도록 -->
</head>
<body>
	
	<!-- login.jsp에서 입력 받은 아이디와 패스워드가 로그인 함수에서 실행되는 과정 -->
	<%
		UserDAO userDAO = new UserDAO(); //UserDAO 인스턴스 생성
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");		//스크립트 문장을 유동적으로 만들어준다
			script.println("location.href = 'main.jsp'");	//로그인 성공 시 main.jsp 로 이동할 수 있도록 해준다
			script.println("</script>");
		}
		else if(result == 0){		//비밀번호가 틀린 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println( "alert ('비밀번호가 틀립니다') ");
			script.println( "history.back()" );				//이전 페이지로 사용자를 다시 돌려보낸다. 즉, 로그인 페이지로 돌려보내는 것!
			script.println("</script>");
		}
		else if(result == -1){		//아이디가 존재하지 않는 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println( "alert ('존재하지 않는 아이디입니다.') ");
			script.println( "history.back()" );				
			script.println("</script>");
		}
		else if(result == -2){		
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println( "alert ('데이터베이스 오류가 발생했습니다.') ");
			script.println( "history.back()" );			
			script.println("</script>");	
		}
	%>
	
	<!-- 다 작성 후, mysql에 접속하기 위한 드라이버 프로젝트 lib 폴더에 추가하기 -->
</body>
</html>