<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %>    
<body>
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
                            게시글 등록
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                        <form action="/board/register" method="post">
                        
                        <label>제목</label>
						<input class="form-control" placeholder="제목을 적어주세요" type="text" name="title" required="required">                        
                      
                        <br><br>
                        
                        <label>내용 </label>
                        <textarea class="form-control" placeholder="내용을 적어주세요" type="text" name="content" row="100"></textarea>     
                       	<br><br>
                        
                        
                        <label>작성자</label>
                        <input class="form-control" placeholder="작성자를 적어주세요" type="text" name="writer"><br><br><br>
                        
                        <br>
	 						<button type="submit" class="btn btn-outline btn-default">글등록</button>
	 					    <button type="reset" class="btn btn-outline btn-default">다시쓰기</button>
	 					</form>
 
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

    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>


    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

    </script>

</body>

</html>
