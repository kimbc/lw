문제7>

6.a 항목(제 2형 당뇨병을 진단받은 환자)에서 추출한 환자군의 의약품 처방이 변경된
패턴을 높은 빈도 순으로 나열합니다.
a. 같은 날 처방된 약은 한 그룹으로 묶습니다.
b. drug_concept_id는 다음을 사용합니다.
i. digoxin: 19018935
ii. simvastatin: 1539411,1539463
iii. clopidogrel: 19075601
iv. naproxen: 1115171


SQL>

select person_id, count(distinct drug_exposure_start_date) as cnt
from drug_exposure a
where drug_concept_id in (19018935, 1539411, 1539463, 19075601, 1115171)
and exists (
select 
1
from condition_occurrence 
where condition_concept_id in
(
3191208,36684827,3194332,3193274,43531010,4130162,45766052,
45757474,4099651,4129519,4063043,4230254,4193704,4304377,201826,3194082,3192767
)
and person_id = a.person_id
)
group by person_id
order by cnt desc


Result>

2833968	245
478532	172
1444791	107
347825	95
2074366	29
609120	28
2537704	28
2694671	25
31196	24
1116539	23
2369278	21
487607	16
2577809	13
1891866	9
2170146	9
537462	5
2452672	5
939449	2
631283	2
170280	2
50663	1
67212	1
843873	1
892185	1
1496597	1
1537987	1
1737916	1
1743075	1
1979909	1