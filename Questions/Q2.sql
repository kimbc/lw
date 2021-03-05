문제2>

visit_occurrence 테이블은 병원에 방문한 환자들의 방문식별번호(id), 병원 방문
시작일자, 종료일자, 방문 타입(내원, 외래 등) 등 병원 방문과 관련된 정보를 포함하고
있습니다. 내원일수는 환자가 요양기관을 방문하여 진료를 받은 일수이며, `내원일수
= 방문종료일자 - 방문시작일자 + 1` 으로 계산합니다. 모든 환자에 대해 총
내원일수를 구하고 총 내원일수의 최대값과 총 내원일수 최대값을 가지는 환자수를
찾는 쿼리를 작성합니다.
	a. 방문시작일자는 visit_start_date, 방문종료일자는 visit_end_date 를 사용합니다.


SQL>

select
person_id, sum(to_date(visit_end_date,'YYYY-MM-DD') - to_date(visit_start_date,'YYYY-MM-DD') + 1) as cnt
from 
visit_occurrence 
group by person_id
order by cnt desc
limit 1


Result>

"1059760"	18873