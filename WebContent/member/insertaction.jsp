<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="data.dao.MemberDao"/>
<jsp:useBean id="dto" class="data.dto.MemberDto"/>
<!-- 전체 데이타 읽어서 dto에 넣기 -->
<jsp:setProperty property="*" name="dto"/>
<%
//메서드 호출
dao.insertMember(dto);


//바코드 난수 발생
	//	public String getBarcodeNum(int len, int dupCd ) {
	        
	 /*       Random rand = new Random();
	        String numStr = ""; //난수가 저장될 변수
	        
	        for(int i=0;i<len;i++) {
	            
	            //0~9 까지 난수 생성
	            String ran = Integer.toString(rand.nextInt(10));
	            
	            if(dupCd==1) {
	                //중복 허용시 numStr에 append
	                numStr += ran;
	            }else if(dupCd==2) {
	                //중복을 허용하지 않을시 중복된 값이 있는지 검사한다
	                if(!numStr.contains(ran)) {
	                    //중복된 값이 없으면 numStr에 append
	                    numStr += ran;
	                }else {
	                    //생성된 난수가 중복되면 루틴을 다시 실행한다
	                    i-=1;
	                }
	            }
	        }
	        return numStr;
	    }

*/
//successpage 페이지 이동
response.sendRedirect("../index.jsp?main=member/successpage.jsp");
%>