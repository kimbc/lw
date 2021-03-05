문제 6>

6. 아래 조건에 모두 해당하는 환자수를 추출합니다.
a. 제 2형 당뇨병을 진단받은 환자 중에
i. 당뇨환자의 condition_concept_id 는 다음을 사용합니다.
3191208,36684827,3194332,3193274,43531010,4130162,45766052,
45757474,4099651,4129519,4063043,4230254,4193704,4304377,201826,3194082,3192767
b. 18세 이상의 환자 중에
c. 진단을 받은 이후 Metformin을 90일 이상 복용한 환자수
i. drug_concept_id 는 40163924 를 사용합니다.


SQL>

select count(1)
from
(
select 
count(c.person_id)
from condition_occurrence a, person b, drug_exposure c
where a.person_id = b.person_id
and b.person_id = c.person_id
and c.drug_concept_id = 40163924
and condition_concept_id in
(
3191208,36684827,3194332,3193274,43531010,4130162,45766052,
45757474,4099651,4129519,4063043,4230254,4193704,4304377,201826,3194082,3192767
)
and cast(to_char(now(),'YYYY') as int) - cast(b.year_of_birth as int) >= 18
group by c.person_id
having to_date(max(drug_exposure_end_date),'YYYY-MM-DD') - to_date(min(drug_exposure_start_date), 'YYYY-MM-DD') >= 90
) a


Result>

30