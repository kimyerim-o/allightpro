// 천단위 콤마
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
$(function(){
	//모두체크
	$("#allCheck").click(function(){
		var check = $('#allCheck').prop("checked");
		if(check){
			//alert($('.chkBox').length);
			//체크박스 선택시 결제금액 변경
			$(".chkBox").prop("checked", true);
			var chk = 0;
			$(".chkBox:checked").each(function(){
				var temp = $(this).closest('td').next('td').next('td').next('td').next('td').next('td')
				chk += Number(temp.text().split("원")[0].replace(',',''));
			})
			$('.sum').children().text(numberWithCommas(chk)+"원");
		} else{
			//alert($('.chkBox').length);
			$(".chkBox").prop("checked", false);
			//체크박스 선택시 결제금액 0원으로 변경
			$('.sum').children().text("0원");
		}
	});//end 모두체크
	
	//전체선택 누르면 개별 체크박스 모두 선택되게
	$(".chkBox").click(function(){
		//alert("ㄷㅇㅇㄴ");
		$("#allCheck").prop("checked", false);
		
	});
	
	//체크된 item만 합계내기
	$(".chkBox").change(function(){
		var chk = 0;
		$(".chkBox:checked").each(function(){
			var temp = $(this).closest('td').next('td').next('td').next('td').next('td').next('td')
			chk += Number(temp.text().split("원")[0].replace(',',''));
			//alert(chk)
		})
		$('.sum').children().text(numberWithCommas(chk)+"원");
	})
	
	/*//체크된 item개수
	$(".chkBox").change(function(){
		var qt = 0;
		$(".chkBox:checked").each(function(){
			var qtemp = $(this).closest('td').next('td').next('td').next('td').next('td').next('td')
			alert("qtemp"+qtemp)
			qt += Number(qtemp.text());
			alert("qt="+qt)
		})
		$('.sum').children().text(numberWithCommas(chk)+"원");
	})*/
	
	//선택삭제
	$(".selectDelete_btn").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val == true){
			var checkArr = new Array();
			$("input[class='chkBox']:checked").each(function(){
				checkArr.push($(this).attr("data-cartNo"));
			});//종료 input선택자
			
			$.ajax({
				url : "deleteCart.com",
				type : "get",
				dataType: "text",
				data : {"chkBox" : checkArr},
				success : function(result){
					if(result == "success"){
						alert("삭제되었습니다")
						location.href = "./cart.com";	
					} else{
						alert(result);
						alert("삭제 실패");
					}
				},
				error: function(request,status,error){
					alert("????"+"code = "+ request.status + " message = " + request.responseText + " error = " + error)
				}
			});
		}
	});//end of 선택삭제
	
	// 수량 선택시 총 상품가격 변동
	// - 버튼 눌렀을때
	$('.minus').click(function(){
		$target = $(event.target);
		if ($target.next('input').val() != 1 ){//수량을 1보다 적게 선택할수 없게
			var $total = $target.next('input').val($target.next('input').val()-1);
		}
		// minus button에서 합계 caprice로 찾아가기
		var minus = $target.closest('td').next('td').children('div').children('p');
		//alert(minus.text())
		var val = Number($target.next('input').val());	//수량 input값 변수선언
		var price = $target.closest('td').prev('td').children('div').children('.price');
		price = Number(price.text().split("원")[0].replace(',',''));//변수 price reformat
		minus.text(numberWithCommas(val*price)+"원");
		
		var chk = 0;
		$(".chkBox:checked").each(function(){
			var temp = $(this).closest('td').next('td').next('td').next('td').next('td').next('td')
			chk += Number(temp.text().split("원")[0].replace(',',''));
			//alert("요기?"+chk)
		})
		$('.sum').children().text(numberWithCommas(chk)+"원");
		
		/*var qt = 0;
		$(".chkBox:checked").each(function(){
			var qtemp = $(this).closest('td').next('td').next('td').next('td').next('td').next('td')
			alert("qtemp"+qtemp)
			qt += Number(qtemp.text());
			alert("qt="+qt)
		})
		$('.qty').children().text();*/
	})
	
	// + 버튼 눌렀을때
	$('.plus').click(function(){
		$target = $(event.target);
		var $total = $target.prev('input').val(Number($target.prev('input').val())+1);
		
		// plus button에서 합계 caprice로 찾아가기
		var plus = $target.closest('td').next('td').children('div').children('p');
		var val = Number($target.prev('input').val());
		var price = $target.closest('td').prev('td').children('div').children('p');
		price = Number(price.text().split("원")[0].replace(',',''));
		//alert(val*price)
		plus.text(numberWithCommas(val*price)+"원");
		
		var chk = 0;
		$(".chkBox:checked").each(function(){
			var temp = $(this).closest('td').next('td').next('td').next('td').next('td').next('td')
			chk += Number(temp.text().split("원")[0].replace(',',''));
			//alert(chk)
		})
		$('.sum').children().text(numberWithCommas(chk)+"원");
	})
	
}); // end of function()