use CleaningDB
go

/*
1) I offer deep cleans for each customer on request. Deep cleans take twice as long as normal cleans.
   I charge 50% more than a regular clean in that house. 
   For this I need to see the customers phone number, last name and the amount of money they will have to pay.
   Please do it in this format:  last name, first name (phone number) - price of service.
*/
select DeepCleanService = concat(s.CustomerLastName, ' ', s.CustomerFirstName, ' (', s.PhoneNum, ') - ', convert(decimal(4,1),s.PriceDeepClean))
from SpruceUp s
/*
2) I would like to know how many months I have been working for each current customer. 
   If you could show the customers I have worked for for the longest time at the top, I would appreciate that.
   Please include a column formatted like this: last name - weekly/bi weekly and a column for number of months
*/
select Customer = concat(s.CustomerLastName, ' - ', case s.Weekly when 1 then 'Weekly' else 'Bi Weekly' end), NumOfMonth = datediff(month,s.DateStarted,isnull(s.DateEnd,getdate()))
from SpruceUp s
order by NumOfMonth desc
/*
3) What is the average price I ask per hour for regular cleans and what is the average price per hour for deep cleans?
*/
select AvgPricePerHourNormal = convert(decimal(3,1),avg(s.PriceHour)), AvgPricePerHourDeep = convert(decimal(3,1),avg(s.PriceDeepClean / s.NumOfHours))
from SpruceUp s
/*
4) Which customer do I earn the most money from in a year? (not counting deep cleans)
   And how much do I get from them?
*/
select top 1 s.CustomerLastName, s.CustomerFirstName, MoneyEarningYear = sum(s.EarnMonth * 12)
from SpruceUp s
group by s.CustomerLastName, s.CustomerFirstName
order by MoneyEarningYear desc
/*
5) How many customers did I gain in the year 2020 and how many did I lose?
*/
select GainedLost = 'Lost', NumOfCustomers = count(s.DateEnd)
from SpruceUp s
where year(s.DateEnd) = 2020
union select 'Gained' , NumOfCustomers = count(s.DateStarted)
from SpruceUp s
where year(s.DateStarted) = 2020