use CleaningDB
go

-- Test nulls
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select null, 'Smith', '123 456 7890', '2 2nd street', 1, 20, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', null, '123 456 7890', '2 2nd street', 1, 20, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', null, '2 2nd street', 1, 20, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', null, 1, 20, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', '2 2nd street', null, 20, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', '2 2nd street', 1, null, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', '2 2nd street', 1, 20, null, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', '2 2nd street', 1, 20, 4, null
go

-- Test Blank or 0 or wrong price and hours
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select '', 'Smith', '123 456 7890', '2 2nd street', 1, 20, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', '', '123 456 7890', '2 2nd street', 1, 20, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '', '2 2nd street', 1, 20, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', '', 1, 20, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', '2 2nd street', 1, 19, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', '2 2nd street', 1, 36, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', '2 2nd street', 1, 35, 9, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', '2 2nd street', 1, 20, 0, '2020-10-01'
go

-- Test wrong dates and phone num
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 789', '2 2nd street', 1, 20, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 78900', '2 2nd street', 1, 20, 4, '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', '2 2nd street', 1, 20, 4, '2017-01-14'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted,DateEnd)
select 'John', 'Smith', '123 456 7890', '2 2nd street', 1, 20, 4, '2020-10-02', '2020-10-01'
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', '2 2nd street', 1, 20, 4, dateadd(day,1,getdate())
go
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted,DateEnd)
select 'John', 'Smith', '123 456 7890', '2 2nd street', 1, 20, 4, '2020-10-02', dateadd(day,1,getdate())
go

-- Test unique
insert SpruceUp(CustomerFirstName,CustomerLastName,PhoneNum,CustomerAddress,Weekly,PriceHour,NumOfHours,DateStarted)
select 'John', 'Smith', '123 456 7890', '3478 71st Ave N', 1, 20, 4, '2020-10-01'
go