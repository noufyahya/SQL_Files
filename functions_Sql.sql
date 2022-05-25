select avg([Total]) 
from [POSDB].[dbo].[Sales_Master] 

select min([Total]) as MIN_Total, max([Total]) as MAX_Total
from [POSDB].[dbo].[Sales_Master] 

select  [cus_date] as Buying_Date ,avg([Total]) over(
		 PARTITION BY [cus_date]
		 order by [Billno]
		 rows between  1 PRECEDING AND CURRENT ROW) as Total_avg
from [POSDB].[dbo].[Sales_Master]

select [Billno] ,[Customer] as Name_ ,avg([Total]) over(
		 PARTITION BY [cus_date] 
		 order by [Billno]
		 rows between  1 PRECEDING AND CURRENT ROW) as Total_avg
from [POSDB].[dbo].[Sales_Master]


select [Billno],[ItemName],avg([Price]) over(
			PARTITION BY [Price]
			order by [Billno]
			rows between  1 PRECEDING AND CURRENT ROW) as Price_Average
from [POSDB].[dbo].[Sales_Detail]

-- row of max total 
select Billno, Customer,Total
from [POSDB].[dbo].[Sales_Master]
where Total=(select max([Total])
			from [POSDB].[dbo].[Sales_Master])

select Billno, Customer,Total
from [POSDB].[dbo].[Sales_Master]
where Total=( select min([Total])
			from [POSDB].[dbo].[Sales_Master] )


select [itemNo], [itemName], price
from [POSDB].[dbo].[itemMaster]
where price =(select min(price)
				from [POSDB].[dbo].[itemMaster]
				having min(price) < 30)

select d.[Billno],d.[ItemNo],d.[ItemName],d.Price
from [POSDB].[dbo].[Sales_Detail] as d
inner join [POSDB].[dbo].[Sales_Master] as m
on d.[Billno]= m.Billno

select [Billno], [Customer], [Total]
from [POSDB].[dbo].[Sales_Master]

 
select [itemNo], [itemName], price
from [POSDB].[dbo].[itemMaster]
where price >= (select avg(price)
				from [POSDB].[dbo].[itemMaster])

select [itemNo], [itemName], price, tax
from [POSDB].[dbo].[itemMaster]
where price< tax

select [Billno], [ItemNo], [ItemName],[Price]
from [POSDB].[dbo].[Sales_Detail]
where price in (select price
				from [POSDB].[dbo].[itemMaster]
				where price < tax)


  select sum([Total]) as sum_total, avg([Total]) as avg_total
  from [POSDB].[dbo].[Sales_Master]

select *, avg([Total]) over(
					PARTITION BY [Billno]
					order by [Tax_m]
					rows between 1 PRECEDING AND CURRENT ROW) as avg_total 
from [POSDB].[dbo].[Sales_Master]

select [Billno], [ItemName], [Price], avg(price)over (
										PARTITION BY [Billno]
										order by [Tax]
										rows between 1 PRECEDING AND CURRENT ROW) as avg_price
from [POSDB].[dbo].[Sales_Detail]

select [Billno],[Customer],[Tax_m],avg([Total]) over(
									PARTITION BY [Billno]
									ORDER BY [Tax_m]
									ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as avg_TOTAL
FROM [POSDB].[dbo].[Sales_Master]

SELECT [itemNo],[itemName], AVG([price]) OVER(
							PARTITION BY [itemNo]
							ORDER BY [itemName]
							ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING) AS AVG_PRICE
		FROM [POSDB].[dbo].[itemMaster]

select [id],[customer],[email]
from [POSDB].[dbo].[sales_customer]

select [Billno],[ItemName] , avg([Price])over(
							PARTITION BY [Billno]
							order by [Tax]
							ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING) as avg_price
from [POSDB].[dbo].[Sales_Detail]

select * from  [POSDB].[dbo].[Sales_Master] where [Customer] like 'A%'


select top 1 [Price] from(
				select top 3 [Price]
				from [POSDB].[dbo].[Sales_Detail]
				order by price desc) as oo
order by [Price] asc

select [Billno]
from [POSDB].[dbo].[Sales_Master]

intersect

select [Billno]
from [POSDB].[dbo].[Sales_Detail]


