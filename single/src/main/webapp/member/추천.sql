delete sns_login;
commit;

delete single_user commit;

select * from sns_login ;

select * from single_user ;

select * from single_board ;


--!! 유저관련 태그 생성 !!--
-- 게시글: 요리 레시피  -태그 - #휴식이 필요해 #힐링 #쉬어요
-- 게시글: 요리 레시피 - 라면 -태그- #냉라면 #신라면 투움바 #파채라면
-- 게시글: 요리 레시피 - 이색음식 -태그- #비리아 #팟 키마오 #라솔니크 
-- 게시글: 요리 레시피 - 이색음식 -태그- #비리아 #팟 키마오 #라솔니크 
-- 게시글: 자취러 게시판  - #자취 첫 구매물품 #
-- 게시글: 자취러 게시판  - #영어단어

-- 게시글: 자취생활 게시판 - 태그 - #운동 #1일 #팔굽혀펴기100개
-- 게시글: 자취생활 게시판 - 태그 - #청소 #청소롤 #일반쓰레기봉투 (좋아요)
-- 게시글: 자취생활 게시판 - 태그 - #게임 #롤 #리그오브레전드 #심해 (좋아요) 
-- 게시글: 자취생활 게시판 - 태그 - #게임 #히오스 #랭커 
-- 게시글: 자취생활 게시판 - 태그 - #공부 #취업준비 #자원봉사 (좋아요)
-- 게시글: 자취생활 게시판 - 태그 - #공부 #영어 


--!! 그룹 추천 받기 !!--
-- 1. 그룹 게시글 리스트 읽어오기(ALL)
-- 그룹 게시글: 취미 - 태그 - #게임 #리오레
-- 그룹 게시글: 스터디 - 태그 - #독서모임
-- 그룹 게시글: 스터디 - 태그 - #자원봉사 #학점 
-- 그룹 게시글: 친목도모 - 태그 - #보드게임
-- 그룹 게시글: 친목도모 - 태그 - #영화보러다녀요
-- 그룹 게시글: 맛집탐방 - 태그 - #카페탐방
-- 그룹 게시글: 맛집탐방 - 태그 - #술고래 #술먹방

-- 2.그룹 파싱
--1. 유저가 좋아요한 게시글의 해시태그들 얻어오기
--2. 좋아요한 해시태그가 포함된 그룹들 찾아오기
--3. 


--hth0893@naver.com 가 좋아요한 게시글들
select * from 
single_board b JOIN single_like l using (board_num)
where l.user_id = 'hth0893@naver.com';

--hth0893@naver.com 가 좋아요한 게시글의 해시태그 =>1
select chr(39)||'%'||LISTAGG(trim(hashtag_content), '%|%') WITHIN group(Order by hashtag_content)||'%'||chr(39)  from (select * from 
                    single_board b JOIN single_like l using (board_num)
                    where l.user_id = 'hth0893@naver.com') lt JOIN single_hashtag using (board_num);
                    
select chr(39)||LISTAGG(trim(hashtag_content), '|') WITHIN group(Order by hashtag_content)||chr(39)  
from (select * 
        from single_board b JOIN single_like l using (board_num)
        where l.user_id = 'hth0893@naver.com') lt JOIN single_hashtag using (board_num);
-- 힐링, 휴식이 필요해, 쉬어요 -> LISTAGG -> '힐링|힐링이필요해'


--'힐링' 해시태그를 포함하는 그룹 =>2
select *
from single_group JOIN single_hashtag h using (group_num)
where UPPER(h.hashtag_content) like UPPER('%힐링%');


-- 힐링, 힐링이필요해 ->WHERE REGEXP_LIKE('힐링', '홍|김|서') -- 그룹의 
--작은 따옴표가 필용없다.
select *
from single_group JOIN single_hashtag h using (group_num)
where REGEXP_LIKE(hashtag_content,
                                                    (select LISTAGG(trim(hashtag_content), '|') WITHIN group(Order by hashtag_content)  
                                                    from (select * 
                                                            from single_board b JOIN single_like l using (board_num)
                                                            where l.user_id = 'hth0893@naver.com') lt JOIN single_hashtag using (board_num)
                                                    )
                                );
                    


select *
from single_group JOIN single_hashtag h using (group_num)
where REGEXP_LIKE( hashtag_content,(select  '힐링|야호'
                                                         from dual)
                             );

--좋아요한 게시글의 해시태그가 하나라도 존재하는 그룹  -> 1 join 2


select * 
from single_group JOIN single_hashtag h using (group_num)
where UPPER(h.hashtag_content) like (select '%'||UPPER(hashtag_content)||'%' 
                                                        from (select * from (select * from 
                                                                single_board b JOIN single_like l using (board_num)
                                                                where l.user_id = 'hth0893@naver.com') lt JOIN single_hashtag using (board_num)));
                                
    
select '%'||UPPER('힐링')||'%'  from dual;

select * from single_like;
select * from single_hashtag;
select * from single_board;

insert into single_like values(1,'hth0893@naver.com');










delete single_group_member;
commit;

select * from single_user;

select * from sns_login;

select * from single_stamp;

select * from single_hashtag;


select * from  single_board;

select * from  single_board_list;

commit;


select user_id userId, user_password userPassword, user_nickname userNickname, user_profile userProfile, user_name userName, user_birthday userBirthday
                       , user_gender userGender, user_phone userPhone, user_zipcode userZipcode, user_address userAddress, user_addressdetail userAddressDetail
                       , user_joindate userJoindate, user_outdate userOutdate, user_statecode userStatecode
                       , auth_key authKey, auth_state authState
	from single_user join sns_login using(user_id)
    where user_id = 'hth0893@naver.com';
    
	
    

update single_user 
set auth_key ='auth'
where user_id  = 'userId';

select *
	from single_user
	where user_id = 'hth0893@naver.com';

select * from sns_login;

commit;


select user_id, user_password, user_nickname, user_name, user_profile, user_birthday
                        ,user_gender, user_phone, user_zipcode, user_address, user_addressdetail, user_joindate, user_outdate, user_statecode
                        ,auth_key, auth_state
	from single_user
	where user_id = 'hth0893@naver.com';



insert into single_user (user_id, user_password, user_nickname, user_name, user_profile, user_birthday,
                        user_gender, user_phone, user_zipcode,user_address, user_addressdetail, user_joindate, user_outdate, user_statecode,
                        auth_key, auth_state)
values(#{userId}, #{userPassword},#{userNickname},#{userName},#{userProfile},to_date(#{userBirthday},'MMDDYYYY')
                        ,#{userGender},#{userPhone},#{userZipcode},#{userAddress},#{userAddressDetail},#{userJoindate},#{userOutdate},#{userStatecode}
                        ,#{auth_key}, #{auth_state});		
                        
                        
                        
insert into single_user (user_id, user_password, user_nickname, user_name, user_profile, user_birthday
                        , user_gender, user_phone, user_zipcode,user_address, user_addressdetail, user_joindate, user_outdate, user_statecode
                        , auth_key, auth_state)
values ('userId', 'userPassword', 'usernickname', 'username', 'userprofile', to_date(01111993,'MMDDYYYY')
                        ,'F', '01074490893', '우편코드', '우편주소', '우편상세', sysdate, sysdate, '0'
                        , 'authuuid', '0');		

select user_id, user_password, user_nickname, user_name, user_profile, user_birthday,
                        user_gender, user_phone, user_zipcode,user_address, user_addressdetail, user_joindate, user_outdate, user_statecode,
                        auth_key, auth_state
from single_user;

select  to_date(01111993,'MMDDYYYY') from  dual;