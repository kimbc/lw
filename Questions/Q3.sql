문제3>

환자들이 진단 받은 상병 내역 중 첫글자는 (a,b,c,d,e) 문자로 시작하고 중간에 “heart”
단어가 포함된 상병 이름을 찾으려고 합니다. condition_occurrence 테이블은 환자가
병원 방문시 진단 받은 질환이 담겨있습니다. 상병코드는 condition_concept_id이고,
concept 테이블의 concept_id와 조인하여 상병 이름을 찾을 수 있습니다.
(concept_name 컬럼 사용)
a. 문자 검색시 대소문자를 구분하지 않습니다.
b. 상병 이름을 중복없이 나열합니다.


SQL>

select distinct(concept_name)
from
condition_occurrence a,  concept b
where a.condition_concept_id = b.concept_id
and (
	lower(concept_name) like lower('a%heart%')
	or lower(concept_name) like lower('b%heart%')
	or lower(concept_name) like lower('c%heart%')
	or lower(concept_name) like lower('d%heart%')
	or lower(concept_name) like lower('e%heart%')
	)

Result>

"Chronic congestive heart failure"