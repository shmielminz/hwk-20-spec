use CleaningDB
go

drop table if exists SpruceUp
go

create table dbo.SpruceUp(
    SpruceUpId int not null identity primary key,
    CustomerFirstName varchar(25) not null constraint ck_SpruceUp_first_name_cannot_be_blank check(CustomerFirstName > ''),
    CustomerLastName varchar(25) not null constraint ck_SpruceUp_last_name_cannot_be_blank check(CustomerLastName > ''),
    PhoneNum varchar(12) not null constraint ck_SpruceUp_phone_num_needs_to_be_valid check(PhoneNum like '[1-9][0-9][0-9]%[0-9][0-9][0-9]%[0-9][0-9][0-9][0-9]'),
    CustomerAddress varchar(50) not null 
        constraint ck_SpruceUp_address_cannot_be_blank check(CustomerAddress > '')
        constraint u_SpruceUp_CustomerAddress unique,
    Weekly bit not null,
    PriceHour decimal(4,2) not null constraint ck_SpruceUp_price_must_be_greater_than_20_and_not_exceed_35 check(PriceHour between 20 and 35),
    NumOfHours int not null constraint ck_SpruceUp_num_of_hours_must_be_greater_than_0 check(NumOfHours > 0),
    DateStarted date not null constraint ck_SpruceUp_date_started_must_be_between_15_01_2017_and_today check(DateStarted between '2017-01-15' and getdate()),
    DateEnd date null,
    constraint ck_date_end_must_be_after_date_started_and_cannot_be_in_future check(DateEnd is null or DateEnd between DateStarted and getdate()),
    EarnMonth as case Weekly when 1 then PriceHour * NumOfHours * 4 else PriceHour * NumOfHours * 2 end persisted,
    PriceDeepClean as PriceHour * NumOfHours * 1.50 persisted constraint ck_price_deep_clean_cannot_exceed_424 check(PriceDeepClean <= 424)
)
go