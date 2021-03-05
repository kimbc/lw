문제 5>

drug_exposure 테이블은 환자가 병원에서 처방받은 약의 종류와 처방시작일과
종료일에 대한 정보를 포함하고 있습니다. drug_exposure 테이블로부터 선택된
15가지의 약 번호와 약품명이 저장된 첫번째 drugs 테이블이 있으며, 15가지 약 별로
drug_exposure에 저장된 처방건수가 저장된 두번째 prescription_count 테이블이
있습니다. 마지막으로 drugs 테이블에 해당되는 15가지 약별로 가장 많이 처방되는
약을 짝지어 놓은 drug_pair 테이블이 있습니다. 3개의 테이블을 사용하여 짝지어진
두번째 약의 처방 건수가 첫번째 약의 처방 건수보다 더 많은 첫번째 약의 약품명을
처방건수 순으로 출력합니다.
a. drugs : drug_concept_id(첫번째약 번호), concept_name(약품명)
b. prescription_count : drug_concept_id(첫번째약 번호), cnt(처방건수)
c. drug_pair : drug_concept_id1(첫번째약 번호), drug_concept_id2(두번째약번호)
d. 아래 쿼리를 활용하세요.
create temporary table drug_pair (drug_concept_id1 int, drug_concept_id2 int);
insert into drug_pair values 
(40213154,19078106),
(19078106,40213154),
(19009384,19030765),
(40224172,40213154),
(19127663,19009384),
(1511248,40169216),
(40169216,1511248),
(1539463,19030765),
(19126352,1539411),
(1539411,19126352),
(1332419,19126352),
(40163924,19078106),
(19030765,19009384),
(19106768,40213154),
(19075601,19126352);

with drug_list as (
select distinct drug_concept_id, concept_name, count(*) as cnt from
drug_exposure de
join concept
on drug_concept_id = concept_id
where concept_id in (
40213154,19078106,19009384,40224172,19127663,1511248,40169216,1539463,
19126352,1539411,1332419,40163924,19030765,19106768,19075601)
group by drug_concept_id,concept_name
order by count(*) desc



SQL>


-- drugs 테이블 생성

create temporary table drugs (drug_concept_id1 int, concept_name varchar);

insert into drugs 
select distinct drug_concept_id, concept_name  from
drug_exposure de
join concept
on drug_concept_id = concept_id
where concept_id in (
40213154,19078106,19009384,40224172,19127663,1511248,40169216,1539463,
19126352,1539411,1332419,40163924,19030765,19106768,19075601)
group by drug_concept_id,concept_name


-- prescription_count 테이블 생성

create temporary table prescription_count (drug_concept_id1 int, cnt int);

insert into prescription_count
select distinct drug_concept_id, count(*) as cnt from
drug_exposure de
join concept
on drug_concept_id = concept_id
where concept_id in (
40213154,19078106,19009384,40224172,19127663,1511248,40169216,1539463,
19126352,1539411,1332419,40163924,19030765,19106768,19075601)
group by drug_concept_id 
order by count(*) desc


-- 결과

select c.concept_name 
from prescription_count a, drug_pair b, drugs c
where a.drug_concept_id1 = b.drug_concept_id1
and a.drug_concept_id1 = c.drug_concept_id1
and a.cnt < (select count(1) from drug_exposure where drug_concept_id = b.drug_concept_id2)
order by a.cnt desc


Result>

"hydrochlorothiazide 25 MG Oral Tablet"
"amlodipine 5 MG / hydrochlorothiazide 12.5 MG / olmesartan medoxomil 20 MG Oral Tablet"
"atenolol 50 MG / chlorthalidone 25 MG Oral Tablet [Tenoretic]"
"120 ACTUAT fluticasone propionate 0.044 MG/ACTUAT Metered Dose Inhaler"
"simvastatin 20 MG Oral Tablet"
"amlodipine 5 MG Oral Tablet"
"24 HR metformin hydrochloride 500 MG Extended Release Oral Tablet"
"1 ML epoetin alfa 4000 UNT/ML Injection [Epogen]"
"hydrochlorothiazide 12.5 MG Oral Tablet"
"clopidogrel 75 MG Oral Tablet"