<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.delivery-item {
	border: 1px solid #2c8de0;
	border-radius: 5px;
	padding: 10px;
	margin-bottom: 10px;
}

.modal {
	position: absolute;
	display: none;
	padding: 0.5em 1em;;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: white;
	box-shadow: 0 0 0 2px gray;
	border-radius: 5px;
}

.close {
	position: absolute;
	right: 10px;
	top: 10px;
	cursor: pointer;
}

.box{
	border: 1px solid #2c8de0; 
	border-radius: 5px;"
}
</style>

<script>
	$(function() {
		$(".change-delivery-btn").click(function() {
			$("#deliveryModal").show();
		});

		$(".close").click(function() {
			$("#deliveryModal").hide()
		});

		$(".delivery-btn").click(function() {
			// 선택한 배송지의 정보를 JavaScript 변수에 저장
			var deliveryNo = $(this).parents(".dList").find("[name=deliveryNo]").val();
			var deliveryReceiver = $(this).parents(".dList").find("[name=cdR]").val();
			var deliveryPost = $(this).parents(".dList").find("[name=cdP]").val();
			var deliveryAddr1 = $(this).parents(".dList").find("[name=cad1]").val();
			var deliveryAddr2 = $(this).parents(".dList").find("[name=cad2]").val();
			var deliveryContact = $(this).parents(".dList").find("[name=cct]").val();
			
			// 각각의 필드에 저장한 정보를 설정
			$(".dN").val(deliveryNo);
			$(".dR").val(deliveryReceiver);
			$(".dP").val(deliveryPost);
			$(".ad1").val(deliveryAddr1);
			$(".ad2").val(deliveryAddr2);
			$(".ct").val(deliveryContact);

			// 모달 창 닫기
			$("#deliveryModal").hide();
		});
	});
</script>




<form action="/orders/insert" method="post">
	<div class="container w-800">
	
		<!-- 상품칸 -->
		<div class="flex-container box">
		
			<!-- 이미지 -->
			<div class="row w-50">
              	<img src="/rest/project/download?attatchNo=${projectListPhotoDto.attachNo}">
           	</div>
           	
           	<!-- 상품 내용 -->
			<div class="left w-50">
			
				<input type="hidden" name="projectNo"
					value="${projectDto.projectNo}">
				<div class="mt-10 mb-10">
					${projectDto.projectTitle}
				</div>
				
				<div class="flex-container mt-10 mb-10">
					<div class="me-20">
						${projectDto.projectTotalPrice}원
					</div>
					<div>
						n% 
					</div>
				</div>
				
				<div class="mt-10 mb-10">
					${projectDto.projectEndDate}
				</div>
				
			</div>
	
	
		<!-- 세 개의 정보 / 파도 정보 -->
		<div class="flex-container">
			
			<!-- 세 개의 정보 -->
			<div class="box">
				
				<!-- 구매자 정보 -->
				<div class="row">
					<div>구매자 정보</div>
					<div>${memberDto.memberContact}</div>
					<div> ${memberDto.memberEmail}</div>
				</div>
				
				<!-- 배송지 정보 -->
				<div class="row">
					<div>배송지</div>
					
						<div class="delivery-item">
							<input class="dN" type="hidden" name="deliveryNo" value="${deliveryDto.deliveryNo}"> 
							<input class="dR" type="text" value="${deliveryDto.deliveryReceiver}" readonly>
							<input class="dP" type="text" value="${deliveryDto.deliveryPost}" readonly> 
							<input class="ad1" type="text" value="${deliveryDto.deliveryAddr1}" readonly> 
							<input class="ad2" type="text" value="${deliveryDto.deliveryAddr2}" readonly> 
							<input class="ct" type="text" value="${deliveryDto.deliveryContact}" readonly>
						</div>
						
						<div class="row">
							<button type="button" class="btn change-delivery-btn">변경</button>
						</div>
							
					</div>
				
				<!-- 결제 정보 -->
				<div class="row">
					<div>결제 수단</div>
					<div>내가 보유한 포인트 : ${memberDto.memberPoint}</div>
				</div>
				
			</div>
			
			<!-- 파도 정보 -->
			<div class="box">
				
				<div class="w-50">
					<input type="hidden" name="rewardNo" value="${rewardDto.rewardNo}">
					<div class="row">리워드 구성 : ${rewardDto.rewardType}</div>
					<div class="row">리워드 가격 : ${rewardDto.rewardPrice}원</div>
					<hr>
					서퍼 소개 서퍼 내용
					<hr>
					개인정보 제공 동의 후원 유의사항 확인
				</div>

				<div class="row">
					<button class="btn btn-positive" type="submit">주문하기</button>
				</div>
				
			</div>
			
	</div>	
		

					<div id="deliveryModal" class="modal">
						<div class="modal-content">
							<span class="close">&times;</span>
							<h2>새로운 배송지 선택</h2>
							<div class="container w-400">
								<c:forEach var="deliveryDto" items="${deliveryList}">
									<div class="btn mt-10 dList" style="display: block;">
										<div class="row">
											<input type="hidden" name="deliveryNo"
												value="${deliveryDto.deliveryNo}">
										</div>
										<div class="row">
											<input type="text" name="cdR" value="${deliveryDto.deliveryReceiver}"
												readonly>
										</div>
										<div class="row">
											<input type="text" name="cdP" value="${deliveryDto.deliveryPost}"
												readonly>
										</div>
										<div class="row">
											<input type="text" name="cad1" value="${deliveryDto.deliveryAddr1}"
												readonly>
										</div>
										<div class="row">
											<input  type="text" name="cad2" value="${deliveryDto.deliveryAddr2}"
												readonly>
										</div>
										<div class="row">
											<input type="text" name="cct" value="${deliveryDto.deliveryContact}"
												readonly>
										</div>
										<div class="row">
											<button type="button" class="row btn delivery-btn">선택</button>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					


	</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>