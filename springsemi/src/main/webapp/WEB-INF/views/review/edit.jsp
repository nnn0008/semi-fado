<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.form-input1
   {
    /* a 태그 때문에 추가한 속성 */
    display: inline-block;
    text-decoration: none;
    vertical-align: bottom;

    font-size: 15px;
    padding: 0.5em 1em;
    outline: none; /*outline은 입력 창 선택 시 강조 효과 */
    border: 1px solid #2c8de0 ;
    border-radius: 0.5em;
    line-height: 1.2em;
}
</style>



<div class="container center w-600 mb-50">
   	<hr>
   	<h2>서핑 후기 수정</h2>
   	<hr>
</div>

<form action="edit" method="post">
<div class="container w-600">
	<input type="hidden" name="reviewNo" value="${param.reviewNo}">

	<div class="mb-10">
		첨부파일 등록 <input type="file" name="attach" accept="image/*">
	</div>
	<div>
		<textarea name="reviewContent" class="form-input1 w-100" rows="15" style="resize:none;">
		${reviewDto.reviewContent}</textarea>
	</div>
	<div class="right mt-10">
		<button class="btn btn-positive">작성하기</button>
	</div>
</div>


</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>