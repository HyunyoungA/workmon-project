<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, board.model.vo.*,board.model.vo.Comments "%>
<%
	ArrayList<Attachment> list = (ArrayList) request.getAttribute("imgList");
Board b = (Board) request.getAttribute("b");
ArrayList<Comments> Commentslist = (ArrayList<Comments>) request.getAttribute("comments");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link href="<%=request.getContextPath()%>/css/reviewDetail.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbarLink.jsp"%>
	<form id="notice_detail_wrap"
		action="<%=request.getContextPath()%>/reviewUpdate.no" method="post">
		<div id="notice_flex_box">
			<div id="notice_part">
				<h2 id="page_top_title">알바 후기</h2>
			</div>
			<div id="notice_info_box">
				<input type="hidden" name="boardNum" value="<%=b.getBoardNum()%>">
				<h2><%=b.getBoardTitle()%><input type="hidden"
						name="boardTitle" value="<%=b.getBoardTitle()%>">
				</h2>
				<p id="notice_writer_id">
					아이디 : <span><%=b.getUserId()%><input type="hidden"
						name="UserId" value="<%=b.getUserId()%>"></span>
				</p>
				<p id="notice_writer_date">
					등록일 : <span><%=b.getBoardDate()%><input type="hidden"
						name="BoardDate" value="<%=b.getBoardDate()%>"> </span> ｜ 조회수 :
					<span><%=b.getHits()%><input type="hidden" name="Hits"
						value="<%=b.getHits()%>"></span>
				</p>
				<%
					if (b.getUserId().equals(loginUser.getUserId())) {
				%>
				<input type="submit" id="review_detail_motify"
					style="cursor: pointer; font-size: 12px; background: transparent; border: none;"
					value="수정하기">
				<%
					}
				%>
			</div>
			<div id="notice_content_wrap">
				<p>
					<img
						src="<%if (!list.isEmpty() && list != null) {%>
                       <%=request.getContextPath()%>/img_uploadFiles/<%=list.get(0).getChangeName()%>
                    <%}%>">

				</p>
				<br>
				<textarea id="BoardContent" name="BoardContent" readonly><%=b.getBoardContent()%></textarea>
			</div>
	</form>
	<div id="notice_comment">
		<h6>댓글</h6>
		<textarea maxlength="150" id="replyContent"
			placeholder="150자 이하로 입력해주세요"></textarea>
		<button type="button" id="addComments">댓글 등록</button>
	</div>
	<div id="notice_comment_repl_wrap">
		<div id="notice_comment_repl_1">
			<table id="comSelectTable">
				<%
					if (Commentslist.isEmpty()) {
				%>
				<tr>
					<td colspan='3'>댓글이 없습니다.</td>
				</tr>
				<%
					} else {
				%>
				<%
					for (int i = 0; i < Commentslist.size(); i++) {
				%>
				<tr>
					<td><input type="hidden" id="mentNum" name="mentNum"
						value="<%=Commentslist.get(i).getMentNum()%>"></td>
					<td width="100px"><%=Commentslist.get(i).getUserId()%></td>
					<td width="400px"><%=Commentslist.get(i).getMentContent()%></td>
					<td width="200px"><%=Commentslist.get(i).getMentDate()%></td>
					<%
						if (Commentslist.get(i).getUserId().equals(loginUser.getUserId()) || loginUser.getUserId().equals("admin00")) {
					%>
					<td width="50px"><button type="button" class="deleteBtn"
							id="deleteBtn">삭제</button></td>
					<%
						}
					%>
				</tr>
				<%
					}
				%>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<div id="notice_writer_butt_box">
		<input type="button" value="목록으로"
			onclick="location.href='review_index.html'" />
		<%
			if ((b.getUserId().equals(loginUser.getUserId()) || loginUser.getUserId().equals("admin00")) && loginUser != null) {
		%>
		<input type="button" value="삭제하기" onclick="deleteNotice();" />
		<%
			}
		%>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<script>
	function deleteNotice(){
        var bool = confirm('정말 삭제하시겠습니까?');
        if(bool){
           location.href='<%= request.getContextPath() %>/reviewDelete.no?no=' +<%= b.getBoardNum() %>;
        }
     }
     
     $(function(){
         $('#addComments').click(function(){
            var writer = '<%= loginUser.getUserId() %>';
            var bId = <%= b.getBoardNum() %>;
            var content = $('#replyContent').val();
           var deleteBtn = $('#deleteBtn').val();
           
           $.ajax({
              url: "insertComments.bo",
              type: 'post',
              data: {writer:writer, content:content, bId:bId},
              success: function(data){
                 console.log(data);
                  $replyTable = $('#comSelectTable');
                  $replyTable.html('');//한번 비워줘야 연속해서 댓글이 등록되지않는다.
                 
                  for(var i in data){//i는 배열이라 인덱스이다.
                     var $tr = $('<tr>');
                     var $userId = $('<td>').text(data[i].userId).css('width', '100px');
                     var $mentContent = $('<td>').text(data[i].mentContent).css('width', '400px');
                     var $mentDate = $('<td>').text(data[i].mentDate).css('width', '200px');
                     var $deleteBtn = $('<td>').text(data[i].deleteBtn).css('width', '50px');
                     var $deleteIn = $('<button type="button" class="deleteBtn" id="deleteBtn">삭제</button>').text(data[i].deleteBtn).css('width', '50px');
                     $tr.append($userId);
                     $tr.append($mentContent);
                     $tr.append($mentDate);
                     $tr.append($deleteBtn);
                     $deleteBtn.append($deleteIn);
                     $replyTable.append($tr);
                  }
                  $('#replyContent').val('');//댓글달면 등록이되면서 내가쓴 댓글 지워지면서 등록되는 코드.
              },
              error: function(data){
                 console.log(data);
              }
           });
        });
     })
     
     $(function(){//댓글삭제
        $('.deleteBtn').click(function(){
           var bId = <%= b.getBoardNum() %>;
           var mentNum = $('#mentNum').val();
           
           $.ajax({
              url: "commentsDelete.bo",
              type: 'post',
              data: {bId:bId, mentNum:mentNum},
              success: function(data){
                 console.log(data);
                 $('.wrap-loading').removeClass('display-none');

                 if(data == 'ok'){
                    window.alert('정말 삭제하시겠습니까?');
                    document.location.reload(true);

                 }else{
                    resultStr = "해당 권한이 없습니다.";
                 }
              },
              error: function(data){
                 console.log(data);
              }
           });
        });
     })	
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>