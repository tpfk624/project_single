--점수 매기기 알고리즘 (
select 
    sg.group_num
    , count(sc.calendar_num) as calPoint
    , count(chat.chat_content) chatPoint
    , count(sh.homework_subject) homeworkPoint
    , count(sc.calendar_num) + count(chat.chat_content) + count(sh.homework_subject) result
from single_group sg 
    left outer join single_calendar sc
        on sg.group_num =sc.group_num
    left outer join single_chat chat
        on sg.group_num = chat.group_num
    left outer join single_homework sh
        on sg.group_num = sh.group_num
where sg.group_statecode = '1'
--and parseStr 를 and 조건에 포함 
group by sg.group_num
order by result desc;


--order by 제거 테스트코드
select *
from single_group sg 
    left outer join single_calendar sc
        on sg.group_num =sc.group_num
    left outer join single_chat chat
        on sg.group_num = chat.group_num
    left outer join single_homework sh
        on sg.group_num = sh.group_num
    join single_hashtag st on st.group_num = st.group_num
where sg.group_statecode = '1'
and REGEXP_LIKE(hashtag_content,'영화|친구|구디역|구디|CGV|CG') ;

-- 뽑기
--select *
select group_num
from single_hashtag h
    join
--grade function 
    (
    select sg.group_num groupNum
        , count(sc.calendar_num) as calPoint
        , count(chat.chat_content) chatPoint
        , count(sh.homework_subject) homeworkPoint
        , count(sc.calendar_num) + count(chat.chat_content) + count(sh.homework_subject) sumGrade --총합
     from single_group sg 
        left outer join single_calendar sc --일정이많은
            on sg.group_num =sc.group_num
        left outer join single_chat chat --채팅이 많음
            on sg.group_num = chat.group_num
        left outer join single_homework sh --과제가 많음
            on sg.group_num = sh.group_num
     where sg.group_statecode = '1'
     group by sg.group_num
    ) r
--grade function end
on (r.groupNum = h.group_num)
where REGEXP_LIKE(h.hashtag_content,'영화|친구|구디역|구디|CGV|CG') 
group by group_num, group_num, hashtag_type_num,board_num, calpoint,chatpoint, homeworkpoint,sumGrade
order by sumGrade desc
;

select group_num, hashtag_content from single_group
join single_hashtag using(group_num);

select * from single_hashtag;

select * from single_group;



-- 테스트 코드 지워도됨
select 
    count(chat.chat_content)
from single_group sg 
    left outer join single_calendar sc
        on sg.group_num =sc.group_num
    left outer join single_chat chat
        on sg.group_num = chat.group_num
    left outer join single_homework sh
        on sg.group_num = sh.group_num
where sg.group_statecode = '1'
and sg.group_num = '1';