<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<!-- Written  by 미림-->
	<article>
	    <h2> 리뷰 작성 </h2>
	    <h3> 리뷰를 작성해주세요</h3>    
		<form name="formm" method="post" 
		action="TohomeServlet?command=review_write">
			<fieldset>	
			    <label>Title</label>
			    <input type="text" name="subject"  size="77" ><br>
				<label>Content</label>
			    <textarea rows="8" cols="65" name="content"></textarea><br>
			</fieldset>   
		<div class="clear"></div>
		 <div id="buttons" style="float:right">
			<input type="submit"  value="글쓰기"     class="submit"> 
			<input type="reset"   value="취소"     class="cancel">
			<input type="button"  value="쇼핑 계속하기"  class="submit"  onclick="location.href='NonageServlet?command=index'">	
		  </div>
		</form>
	</article>