create table Countries
(
    CountryId   int identity
        constraint Countries_pk
            primary key nonclustered,
    CountryName nvarchar(100),
    PhoneCode   nvarchar(10),
    IsoCode     nvarchar(10),
    datetime    nvarchar(50) default getdate()
)
go

create table Cities
(
    CityId    int identity
        constraint Cities_pk
            primary key nonclustered,
    CityName  nvarchar(200) not null,
    PhoneCode nvarchar(10),
    PlateCode nvarchar(10),
    CountryId int
        constraint Cities_Countries_CountryId_fk
            references Countries
)
go

create table Towns
(
    TownId    int identity
        constraint Towns_pk
            primary key nonclustered,
    TownName  nvarchar(100) not null,
    CityId    int
        constraint Towns_Cities_CityId_fk
            references Cities,
    CountryId int
        constraint Towns_Countries_CountryId_fk
            references Countries
)
go

create table Neighbourhood
(
    NeighbourhoodId   int identity
        constraint Neighbourhood_pk
            primary key nonclustered,
    NeighbourhoodName nvarchar(100) not null,
    PostalCode        nvarchar(10),
    TownId            int
        constraint Neighbourhood_Towns_TownId_fk
            references Towns,
    CountryId         int
        constraint Neighbourhood_Countries_CountryId_fk
            references Countries
)
go


