<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	 ul,li{
            list-style: none;
        }

        a{
            text-decoration: none;
            color: inherit;
        }

        .list_wrap{
            /* 가로길이 고정 */
            width: 90%;
            /* 최소 가로길이 */
            min-width: 1000px;
            /* 최대 가로길이 */
            max-width: 1200px;
            /* 가운데 정렬 */
            margin: 0 auto;
            padding: 40px;
            margin-top: 15%;
        }

        .list_wrap ul{
            font-size: 0;
        }

        .list_wrap .item {
            width: 20%;
            display: inline-block;
            margin-left: 2%;
            margin-right: 2%;
            margin-top: 2%;
            margin-bottom: 2%;
            box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.5);
        }

        .list_wrap .item .image{
            width: 100%;
            height: 150px;
            background: url(./image/noshowoff.jpg);
            background-repeat: no-repeat;
            background-position: 50% 50%;
            background-size: cover;
        }

        .list_wrap .item .cont{
            padding: 4px;
        }

        .list_wrap .item strong {
            /* 이게 있어야 마진이 적용됨 */
            display: block;
            /* 이미지랑 제목, 내용 간격띄우기 */
            margin: 8px 0 5px 0;
            font-size: 16px;
            /* 글자간격줄이기 */
            letter-spacing: -1px;
        }

        .list_wrap .item p{
            font-size: 12px;
            letter-spacing: -1px;
        }

        .list_wrap .item a{
            /* p태그랑 겹치지 않게하기위함 */
            display: inline-block;
            /* 상하좌우 여백 */
            padding: 3px 6px;
            /* background: #2c8ce09e; */
            border: 1px solid #2c8ce09e;
            font-size: 12px;
            letter-spacing: -1px;
            margin-top: 5px;
            /* transition: ; */
            
        }

        .list_wrap .item a:hover{
            background: #dddddd32;
            color: #2c8ce053;
            
        }
        </style>
        
         <div class="list_wrap">
                <ul>
                    <li class="item">
        
                        <div class="image">
                            <!-- <i class="fa-light fa-heart" style="color: #dcdbdb;"></i> -->
                        </div>
        
                        <div class="cont">
                            <strong>제목</strong>
                            <p>내용</p>
                            <a href="#">바로가기</a>
                        </div>
        
                    </li>
        
                    <li class="item">
        
                        <div class="image">사진</div>
        
                        <div class="cont">
                            <strong>제목</strong>
                            <p>내용</p>
                            <a href="#">바로가기</a>
                        </div>
                        
                    </li>
        
                    <li class="item">
        
                        <div class="image">사진</div>
        
                        <div class="cont">
                            <strong>제목</strong>
                            <p>내용</p>
                            <a href="#">바로가기</a>
                        </div>
                        
                    </li>
        
                    <li class="item">
        
                        <div class="image">사진</div>
        
                        <div class="cont">
                            <strong>제목</strong>
                            <p>내용</p>
                            <a href="#">바로가기</a>
                        </div>
                        
                    </li>
        
                    <li class="item">
        
                        <div class="image">사진</div>
        
                        <div class="cont">
                            <strong>제목</strong>
                            <p>내용</p>
                            <a href="#">바로가기</a>
                        </div>
                        
                    </li>
        
                    <li class="item">
        
                        <div class="image">사진</div>
        
                        <div class="cont">
                            <strong>제목</strong>
                            <p>내용</p>
                            <a href="#">바로가기</a>
                        </div>
                        
                    </li>
        
                    <li class="item">
        
                        <div class="image">사진</div>
        
                        <div class="cont">
                            <strong>제목</strong>
                            <p>내용</p>
                            <a href="#">바로가기</a>
                        </div>
                        
                    </li>
        
                    <li class="item">
        
                        <div class="image">사진</div>
        
                        <div class="cont">
                            <strong>제목</strong>
                            <p>내용</p>
                            <a href="#">바로가기</a>
                        </div>
                        
                    </li>
                    
                    
                </ul>
            </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>