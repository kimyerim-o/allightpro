<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <h2>내 정보 수정</h2>
    <hr>

<style>
     tr {height:30px}
    .t1 {background:white;text-align:left}
    .t2 {background:white;}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function(){
    $('#userid').focus()
    $('#frm1').submit(function(){
        if (!$('#userid').val()) {
            alert('id를 입력하세요')
            $('#userid').focus()
            return false;
        }
        if ($('#userid').val().length<5 || $('#userid').val().length>12){
            alert('id는 5~12자리입니다.')
            $('#userid').focus()
            return false;
        }
        if (!$('#pass').val()) {
            alert('pass를 입력하세요')
            $('#pass').focus()
            return false;
        }
        if ($('#pass').val().length<5 || $('#pass').val().length>12){
            alert('비밀번호는 5~12자리입니다.')
            $('#pass').focus()
            return false;
        }
        if ($('#pass').val()!=$('#pass2').val()) {
            alert('비밀번호 확인을 정확히 입력하세요')
            $('#pass2').val('')
            $('#pass2').focus()
            return false;
        }
        if (!$('#username').val()) {
            alert('이름을 입력하세요')
            $('#username').focus()
            return false;
        }
        msg='id: '+$('#userid').val()+'\n비밀번호:'
        +$('#pass').val()+'\n사용자이름:'+$('#username').val()
        +'\n주민등록번호 :'+$('#idno1').val()+'-'+$('#idno2').val()
        +'\n이메일:'+$('#email').val()
        hobbys=$('input[name="hobby"]:checked')
        //alert(hobbys.length)
        hobby=''
        hobbys.each(function(){
            hobby=hobby+$(this).val()+' '
        })
        msg=msg+'\n취미:'+hobby+
        '\n주소:'+$('#addr').val()+
        '\n직업:'+$('select > option:selected').val()
        alert(msg)
        return false;
    })
})

</script>
</head>

<body>
<form id="frm1">
    <table width="80%">
    <tr class="t1">
        <td colspan="2"><h3>기본 정보</h3></td>
    </tr>

    <tr>
        <td>■ 이름</td>
        <td><input type="text" name="userid" id="username" size="26"></td>
    </tr>

    <tr>
        <td>■ 닉네임</td>
        <td><input type="text" name="userid" id="nick" size="26"></td>
    </tr>

    <tr>
        <td>■ 아이디</td>
        <td><input type="text" name="userid" id="userid" size="26"></td>
    </tr>

    <tr>
        <td>■ 비밀번호</td>
        <td><input type="password" name="pass" id="pass" size="26"></td>
    </tr>

    <tr>
        <td>■ 비밀번호 변경</td>
        <td><input type="password" name="pass2" id="pass2" size="26"></td>
    </tr>

    <tr>
        <td>■ 이메일</td>
        <td><input type="text" name="email" id="email" size="26">
        <select name="email">
            <option>직접입력</option>
            <option>naver.com</option>
            <option>hanmail.net</option>
            <option>daum.net</option>
            <option>nate.com</option>
            <option>hotmail.com</option>
            <option>gmail.com</option>
            <option>icloud.com</option>
            </select>
            <br>
        </td>
    </tr>

         <td>■ 생년월일</td>
         <td><select name="birthday">
            <option>선택</option>
            <option>양력</option>
            <option>음력</option>
            </select>
            <input type="text" name="year" size="2">년
            <input type="text" name="month" size="2">월
            <input type="text" name="day" size="2">일
        </td>
        </tr>

        <tr>
        <td>■ 성별</td>
        <td><input type="radio" name="gender" id="m" checked/>
        <label for="m">남</label>
        <input type="radio" name="gender" id="w"/>
        <label for="w">여</label>
        </td>
        </tr>

        <tr>
            <td>■ 휴대폰번호</td>
            <td><select name="hp number">
                <option selected>010</option>
                <option>011</option>
                <option>016</option>
                <option>017</option>
                <option>019</option>
            </select>
            <input type="text" name="hp" size="2">
            <input type="text" name="hp" size="2">
            <br>
            </td>
        </tr>

    <tr>
    <td><td><br><br>
    <input type="submit" value="수정"/>
    <input type="reset" value="취소"/>
    </td>
    </tr>
    </table>
</form>
</body>
</html>