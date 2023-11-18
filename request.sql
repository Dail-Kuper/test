USE test_kutyavin;

select
	e1.Code as Code1
    ,t2.DateBegin1
    ,t2.DateEnd1
    ,e2.Code as Code2
    ,t2.DateBegin2
    ,t2.DateEnd2
from (

	select 
		*
		,row_number()  over(partition by (ID_Vacation1 * ID_Vacation2) + (ID_Vacation1 + ID_Vacation2) order by ID_Vacation1, ID_Vacation2) as Row_Num
		,if (DateBegin1 > DateBegin2, DateBegin1, DateBegin2) as Intersection_Begin
		,if (DateEnd1 < DateEnd2, DateEnd1, DateEnd2) as Intersection_End
	from (

		select 
			v1.ID as ID_Vacation1
			,v1.ID_Employee as ID_Employee1
			,v1.DateBegin as DateBegin1
			,v1.DateEnd as DateEnd1
			,v2.ID as ID_Vacation2
			,v2.ID_Employee as ID_Employee2
			,v2.DateBegin as DateBegin2
			,v2.DateEnd as DateEnd2
		from test_kutyavin.Vacation as v1, test_kutyavin.Vacation as v2
		where v1.ID_Employee <> v2.ID_Employee
			and v1.DateBegin <= v2.DateEnd
			and v1.DateEnd >= v2.DateBegin

	) as t1

) as t2
inner join Employee as e1 on e1.ID = t2.ID_Employee1
inner join Employee as e2 on e2.ID = t2.ID_Employee2
where t2.Row_Num = 1 
	and '2020-01-01' <= t2.Intersection_End 
    and '2020-12-31' >= t2.Intersection_Begin