//DAO : Database접근 객체의 약자, 실질적으로 데이터베이스에서 회원 정보를 불러오거나
//		데이터베이스에 회원정보를 넣고자 할 때 사용한다.

package user;

//Ctrl + Shift + O 외부 라이브러리 추가
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;	//Connection : 데이터베이스에 접근하게 해주는 하나의 객체
	private PreparedStatement pstmt;
	private ResultSet rs;     //어떠한 정보를 담을 수 있는 하나의 객체
	
	//mysql 접속하기 위한
	//생성자
	public UserDAO() {				//UserDAO를 하나의 객체로 만들었을 때 자동으로 데이터베이스 커넥션이 이루어질 수 있도록 해준다.
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";   	//3306포트(mysql서버자체)에 BBS로 접속할 수 있도록 한다.
			String dbID = "root";	//root계정에 접속할 수 있도록
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");			//mysql Driver를 찾을 수 있도록 // Driver는 mysql에 접속할 수 있도록 매개체 역할을 해주는 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//dbURL에 dbID, dbPassword로 접속할 수 있도록 해준다.
			
		}catch (Exception e) {		//try catch문으로 예외처리
			e.printStackTrace();	//오류가 발생할 경우 printStackTrace를 실행해서 오류가 뭔지 출력할 수 있도록 해준다.
		}
	}
	
	//하나의 계정에 대한 로그인 시도를 해주는 함수 생성
	public int login(String userID, String userPassword) {		//실제로 login 접속을 시도하는 함수(userID와 userPassword를 입력받아서 처리할 수 있도록)
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";  	//USER테이블에서 해당 사용자의 비밀번호를 가져올 수 있도록
		try {
			pstmt = conn.prepareStatement(SQL);			//pstmt(PreparedStatement)에 어떠한 정해진 SQL문장을 데이터베이스에 삽입하는 형식으로 인스터를 가져온다.
			pstmt.setString(1,userID);					//SQL injection 같은 해킹기법 방어하기 위한 수단으로서 PreparedStatement를 이용하는데 
														//"SELECT userPassword FROM USER WHERE userID = ?" 와 같은 하나의 문장을 미리 준비해 놓고 ?를 넣어놓은 뒤
														//나중에 그 ?에 해당하는 내용으로 userID를 넣어준다. 즉, 32번 줄에 userID 매개변수로 넘어온 userID를 ?에 들아갈 수 있도록 해줘서
														//실제로 데이터베이스에는 현재 접속을 시도하고자 하는 사용자의 iD를 입력받아서 그 id가 실제로 존재하는지
														//그리고 실제로 존재한다면 그 비밀번호는 뭔지 이렇게 데이터베이스에서 가져오도록 한다.
			rs = pstmt.executeQuery();	//rs(result set)에 결과를 담을 수 있는 하나의 객체에다가 실행한 결과를 넣어준다.
			if(rs.next()) {				//이제, next라고 해서 결과가 존재한다면 이쪽이 실행되도록
				if(rs.getString(1).equals(userPassword)) {
					return 1;			//아이디가 존재한다면, "SELECT userPassword FROM USER WHERE userID = ?" 의 결과로 나온 userPassword를 받아서 이게 접속을 시도한 패스워드와 동일하면 return 1을 해서
										//로그인 성공 이라는 결과를 반환할 수 있도록 해준다.
										//즉, sql문장("SELECT userPassword FROM USER WHERE userID = ?")을 실행해서 나온 그 결과와 
										//접속을 시도했던 그 패스워드(line 32번)가 일치한다면 1을 반환할수 있도록!
				}else
					return 0;			//위 문구가 그렇지 않다면, return 0을 해서 비밀번호가 틀리다는 걸 알려준다 // 비밀번호 불일치!
			}
			
			return -1;		//아이디가 존재하지 않는다면, 실행될 문구  //return -1을 넣어서 아이디가 없다고 알려준다.
							//즉, "SELECT userPassword FROM USER WHERE userID = ?" 이렇게 실행했을 때, userID로 넣은 값에
							//해당하는 회원이 실제로 존재하지 않는다면 결과값이 나오지 않을 것!
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;	//데이터베이스 오류
		
	}
	
	//회원가입
	public int join(User user) {		//한 명의 사용자를 입력 받을 수 있도록 // User user : User클래스를 이용해서 만들어질 수 있는 인스턴스
		String SQL = "INSERT INTO USER VALUES(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);	//위에 명시한 SQL문장을 넣는 방식으로  pstmt에 인스턴스를 넣어줌
			pstmt.setString (1, user.getUserID());	//위의 ? 값에 들어갈 데이터를 차곡차곡 넣어준다.
			pstmt.setString (2, user.getUserPassword());
			pstmt.setString (3, user.getUserName());
			pstmt.setString (4, user.getUserGender());
			pstmt.setString (5, user.getUserEmail());
			return pstmt.executeUpdate();	//위의 문장을 실행한 뒤에 결과값을 넣을 수 있도록 해준다.
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류 발생시 -1리턴 할 수 있도록
	}
}
