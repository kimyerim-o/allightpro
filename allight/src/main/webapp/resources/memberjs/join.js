//alert("들어왔니?");
function frmChk(join){
    frm=document.getElementById('join');
    if($("#idCheck").css('color')=='rgb(255, 0, 0)'){
		alert('가입 불가능한 아이디입니다.!!!!');
		$("#mid").val("");
		$("#mid").focus();
		return false;
	} // 글씨가 빨간색이면 사용불가능한 아이디이므로, alert창을 띄워준다(아이디 중복가입 방지)
    if(frm.mid.value.length<6 || frm.mid.value.length>15){
    alert('아이디는 6-15자리로 입력하세요')
    frm.mid.focus();
    return false;
    }
    if(frm.mname.value.length<1){
    alert('이름은 필수입니다')
    frm.mname.focus();
    return false;
    }
    if(frm.mnick.value.length<3 || frm.mnick.value.length>12){
    alert('닉네임은 3-12자리로 입력하세요')
    frm.mnick.focus();
    return false;
    }
    if(frm.mpw.value.length<8 || frm.mpw.value.length>30){
    alert('비밀번호는 8-30자리로 입력하세요')
    frm.mpw.focus();
    return false;
    }
    if(frm.mpw.value!=frm.mpw2.value){
    alert('비밀번호가 일치 하지 않습니다')
    frm.mpw2.value='';
    frm.mpw2.focus();
    return false;
    }
    if(frm.mbd.value.length<1){
    alert('생일을 입력하세요')
    frm.mbd.focus();
    return false;
    }
    if(frm.memail.value.length<1){
    alert("이메일을 입력하세요")
    frm.memail.focus();
    return false;
    }
    if(frm.memail2.value.selectedIndex<1){
    alert("이메일을 선택하세요")
    frm.memail2.focus();
    return false;
    }
    //alert(document.getElementById('mhp').value);
    //alert(document.getElementById('mhp').selectedIndex);
    //alert(frm.mhp.value);
    if(confirm("가입하시겠습니까?")){
    frm.submit(join)
    }
    var o = document.getElementById("joinFrm");
    o.src = "corporation/join/admin.com?";
}

function frmChk1(myinfo){
	frm=document.getElementById('myinfo');
	if(frm.mpwd2.value.length<1){
	alert('비밀번호 확인을 입력해주세요')
	frm.mpwd2.focus();
    return false;
	}
	if(frm.mpwd.value!=frm.mpwd2.value){
    alert('비밀번호가 일치 하지 않습니다')
    frm.mpwd2.value='';
    frm.mpwd2.focus();
    return false;
    }
	$("form[id=='myinfo']").submit()
}
    