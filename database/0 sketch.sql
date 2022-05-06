/*
SpruceUp
    SpruceUpId int pk
    CustomerFirstName varchar(25) <> null <> ''
    CustomerLastName varchar(25) <> null <> ''
    PhoneNum varchar(11) <> null <> ''
    Address varchar(50) <> null <> '' unique
    Weekly bit not null
    PriceHour decimal(4,2) <> null >= 20 <= 35
    NumOfHours int <> null > 0
    DateStarted date <> null between January 15, 2017 and today
    DateEnd date null between DateStarted and today
    computed PriceDeep as PriceHour * NumOfHours * 1.50
    computed EarnMonth as Weekly = 1? PriceHour * NumOfHours * 4: PriceHour * NumOfHours * 2;
*/