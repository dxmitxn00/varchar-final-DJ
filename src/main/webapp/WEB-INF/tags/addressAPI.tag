<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
   #address > input {
      width: 210%;
       height: 46px;
       border: 1px solid #ebebeb;
       padding-left: 20px;
       font-size: 16px;
       color: #b2b2b2;
       border-radius: 4px;
       text-align: center;
       margin: auto;
   }
   #detailAddress {
      margin-bottom: 100px;
   }
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }

                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#postcode").val(data.zonecode);
                $("#roadAddress").val(roadAddr);
                $("#jibunAddress").val(data.jibunAddress);

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if (roadAddr !== ''){
                    $("#extraAddress").val(extraRoadAddr);
                } else {
                    $("#extraAddress").val('');
                }

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                var guideTextBox = $("#guide");
                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.html('(예상 도로명 주소 : ' + expRoadAddr + ')');
                    guideTextBox.css("display", "block");
                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.html('(예상 지번 주소 : ' + expJibunAddr + ')');
                    guideTextBox.css("display", "block");
                } else {
                    guideTextBox.css("display", "none");
                }
            },
            theme: {
                bgColor: "#23512E", //바탕 배경색
                searchBgColor: "#FFFFFF", //검색창 배경색
                contentBgColor: "#FFFFFF", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
                //pageBgColor: "", //페이지 배경색
                textColor: "#222222" //기본 글자색
                //queryTextColor: "", //검색창 글자색
                //postcodeTextColor: "", //우편번호 글자색
                //emphTextColor: "", //강조 글자색
                //outlineColor: "", //테두리
            }
        }).open({autoClose: true});
    }
</script>
<div id=address>
   <input type="button" id="addressBtn" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
   <input type="text" id="postcode" placeholder="우편번호" readonly>
   <input type="text" id="roadAddress" placeholder="도로명주소" name="memberAddress" value="${ mdata.memberAddress }" readonly>
   <input type="text" id="jibunAddress" placeholder="지번주소" readonly>
   <input type="text" id="extraAddress" placeholder="참고항목" readonly>
   <input type="text" id="detailAddress" placeholder="상세주소">
</div>
