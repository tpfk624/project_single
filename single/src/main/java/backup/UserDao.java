package backup;

import com.kitri.single.user.model.UserDto;

public interface UserDao {
	void create(UserDto userDto);
	int register(UserDto userDto);
}



/*
 * //회원 정보 입력
 * @Override public void insertUser(MemberVO vo) throws Exception {
 * System.out.println("회원등록완료 !!!"); session.insert(namespace+".insertUser",vo);
 * System.out.println("//////////////////////////////////");
 * System.out.println("회원등록완료 !!!"); 
 * } //email 중복 확인
 * 
 * @Override public MemberVO authenticate(String str) throws Exception { 
 * return session.selectOne(namespace+".checkdupl", str); 
 * 
 * }
 * 
 * //해당 email에 인증 키 업데이트
 * 
 * @Override public void createAuthKey(String memberEmail, String memberAuthKey)
 * throws Exception { MemberVO vo = new MemberVO();
 * vo.setMemberAuthKey(memberAuthKey); vo.setMemberEmail(memberEmail);
 * session.update(namespace + ".createAuthKey", vo);
 *  } //이메일 인증 코드 확인
 * 
 * @Override public MemberVO chkAuth(MemberVO vo) throws Exception { return
 * session.selectOne(namespace + ".chkAuth", vo); 
 * } //인증 후 계정 활성화
 * 
 * @Override public void userAuth(MemberVO vo) throws Exception {
 * System.out.println("인증하나요??");
 * 
 * session.update(namespace + ".userAuth", vo);
 * System.out.println(vo.getUserState()); 
 * }
 */