<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK</title>
</head>

<body>

	callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다.

	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "{3FGMY2V_UXaBQxS0sx0g}", //YOUR_CLIENT_ID
				callbackUrl: "{http://localhost/single/user/logincallback.jsp}", //YOUR_REDIRECT_URL
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);
		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			//status: 유저 정보
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					console.log(naverLogin);
					console.log('접근토큰');
					console.log(naverLogin.accessToken);
					//https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&code=EIc5bFrl4RibFls1&state=9kgsGTfH4j7IyAkg  
					var email = naverLogin.user.getEmail();
					var name = naverLogin.user.getNickName();
					var profileImage = naverLogin.user.getProfileImage();
					var birthday = naverLogin.user.getBirthday();			
					var uniqId = naverLogin.user.getId();
					var age = naverLogin.user.getAge();
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverLogin.user.getEmail();
			
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
// 					메인으로 이동
// 					window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/single/index.jsp");
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
</body>

</html>