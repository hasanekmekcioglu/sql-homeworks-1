use Northwind
go

create FUNCTION ModifyPhoneNumber(@phoneNumber NVARCHAR(20))
    RETURNS NVARCHAR(150)
BEGIN

    DECLARE @phone NVARCHAR(150) =REPLACE(REPLACE(REPLACE(REPLACE(@phoneNumber, ' ', ''), '(', ''), ')', ''), '+', '')
    IF (LEN(@phone) = 11 AND LEFT(@phone, 1) = '0')
        BEGIN

            SET @phone = '9' + @phone
        END

    IF (LEN(@phone) = 12 AND LEFT(@phone, 1) = '9')
        BEGIN
            SET @phone = CONCAT('+',
                                SUBSTRING(@phone, 1, 2), ' (',
                                SUBSTRING(@phone, 3, 3), ') ',
                                SUBSTRING(@phone, 6, 3), ' ',
                                SUBSTRING(@phone, 9, 2), ' ',
                                SUBSTRING(@phone, 11, 2))
        END
    RETURN @phone
END
go


