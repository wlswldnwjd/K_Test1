<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %>    

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시판</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            게시판 목록보기 <a href="/board/register"> &nbsp;&nbsp; 글 등록</a> &nbsp;&nbsp;총 글개수(${pageMaker.total})
                         	  ${count}  
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>글 번호</th>
                                        <th>제 목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
<c:forEach var="board" items="${list}" >                               
                                    <tr class="odd gradeX">
                                    	<td>${board.bno}</td>
                                    	<td><a href="/board/get?bno=${board.bno}">${board.title}</a></td>
                                    	<td><c:out value="${board.writer}"/></td>
                                    	<td><fmt:formatDate pattern="yyy-MM-dd" value="${board.regdate}"/> </td>
                                    	<td><fmt:formatDate pattern="MM-dd hh:mm" value="${board.updatedate}"/> </td>
                                    </tr>
</c:forEach>    

                                   </tbody>
                            </table>
                            
                            
                            <!-- 페이지바 -->
                            <c:if test="${pageMaker.prev}">
                            	<a href="/board/list?pageNum=${pageMaker.startPage-1}&&amount=${pageMaker.cri.amount}"> prev </a>&nbsp;&nbsp;
                            </c:if>
                            
                            	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
                            		<a href="/board/list?pageNum=${num} &amount=${pageMaker.cri.amount}">${num}</a> &nbsp;&nbsp;
                           		</c:forEach>
                           		
                           		
                           	<c:if test="${pageMaker.next}">
                            		<a href="/board/list?pageNum=${pageMaker.endPage+1}&&amount=${pageMaker.cri.amount}"> next </a>&nbsp;&nbsp;
                            </c:if>


                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    
    
<!-- Modal -->
	  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	      <div class="modal-dialog">
	          <div class="modal-content">
	              <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                  <h4 class="modal-title" id="myModalLabel">Modal title</h4>
	              </div>
	              <div class="modal-body">
	             	 ${bno}번 글이 등록되었습니다.
	              </div>
	              <div class="modal-footer">
	                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                  <button type="button" class="btn btn-primary">Save changes</button>
	              </div>
	          </div>
	          <!-- /.modal-content -->
	      </div>
	      <!-- /.modal-dialog -->
	  </div>
	  <!-- /.modal -->
               
               
                            
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>


    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>




<script>
//입력된 글번호 알려주기
var bno = "${bno}";  //읽히는 순서 page->request->session->application
var state = "${state}";
console.log("등록된 글번호는:"+bno);


//알고 있어야 하는 내용
//1.history.replaceState(data,title,url) 히스토리 상태값을 변경해주는 메소드
//2.history.state 히스토리 상태값 읽는 것(history.replaceState() 미사용시 null)
if(history.state){		//javascript에서는 null이면 false
	console.log("히스토리 상태값이 있다.")
}else{
	console.log("히스토리 상태값이 없다.")
}	//크롬에서 바로 전 뒤로가기일 때는, 변경된 내용이 확인된다. 
	//why? 크롬에서 바로 전 바로가기일 때는 내부적으로 모달창 같은 동작 안되게 뭔가 작업을 해놨기 때문



if(bno!=""&& !history.state){   //글번호가 있고
		$("#myModal").modal("show");
}

if(state=="remove" && !history.state){
	$(".modal-body").text("삭제가 정상적으로 처리되었습니다.");
	$("#myModal").modal("show");
	
}else if(state=="modify" && !history.state){
	$(".modal-body").text("수정이 정상적으로 처리되었습니다.");
	$("#myModal").modal("show");
}
history.replaceState({}, null,null);

</script>


</body>
</html>
