문제4>

drug_exposure 테이블은 환자가 병원에서 처방받은 약의 종류와 처방시작일과
종료일에 대한 정보를 포함하고 있습니다. 환자번호 ‘1891866’ 환자의 약 처방
데이터에서 처방된 약의 종류별로 처음 시작일, 마지막 종료일, 복용일(마지막
종료일과 처음시작일의 차이)을 구하고 복용일이 긴 순으로 정렬하여 테이블을
생성합니다.
a. 환자번호 : person_id, 약의 종류 : drug_concept_id, 처방시작일 :
drug_exposure_start_date, 처방종료일 : drug_exposure_end_date


SQL>

select 
drug_concept_id, 
min(drug_exposure_start_date), 
max(drug_exposure_end_date),
to_date(max(drug_exposure_end_date),'YYYY-MM-DD') - to_date(min(drug_exposure_start_date),'YYYY-MM-DD')
from
drug_exposure
where person_id = 1891866
group by drug_concept_id
order by 4 desc

Result>

19009384	"1959-12-01"	"1998-10-06"	14189
19030765	"1988-10-18"	"1998-10-05"	3639
40213154	"1989-09-12"	"1998-07-07"	3220
1539463	"1990-03-13"	"1998-03-11"	2920
40213227	"1993-01-05"	"1993-01-05"	0