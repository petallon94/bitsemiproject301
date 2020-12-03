<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글 엔코딩
request.setCharacterEncoding("utf-8");

%>
<!-- dto,dao usebean -->
<jsp:useBean id="dao" class="data.dao.MemberDao"/>
<jsp:useBean id="dto" class="data.dto.MemberDto"/>
<!-- setproperty: 전체 데이터 읽기 -->
<jsp:setProperty property="*" name="dto"/>

<%
//isIdPassCheck 호출

boolean find=dao.isIdPassCheck(dto.getId(),dto.getPassword());	
System.out.print(dto.getId());
//find가 true 면 수정 메서드 호출후 memberlist 즉 목록이 나오도록 하고
//만약 false면 script 코드로 alert 경고후 이전페이지로 가기

if(find){
dao.updateMember(dto);	
response.sendRedirect("../index.jsp?main=mypage/memberlist.jsp");
}else{%>
<script type="text/javascript">
alert("비밀번호가 맞지 않습니다.");
history.back();
</script>
<%}
%>

