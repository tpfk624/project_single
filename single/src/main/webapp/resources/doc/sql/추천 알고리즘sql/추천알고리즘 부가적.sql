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
order by result desc

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
and sg.group_num = '1'
;