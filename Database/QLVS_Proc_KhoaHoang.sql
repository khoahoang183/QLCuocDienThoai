create procedure Customer_Load
as
begin
	select * from KHACHHANG
end
go
--
create procedure Customer_Add @vTEN NVARCHAR(100),@vTHONGTIN NVARCHAR(100),@vTINHTRANG INT
as
begin
	insert into KHACHHANG (TEN,THONGTIN,TINHTRANG)
	values(@vTEN,@vTHONGTIN,@vTINHTRANG)
end
go
--
create procedure Customer_Update @vMAKH INT,@vTEN NVARCHAR(100),@vTHONGTIN NVARCHAR(100),@vTINHTRANG INT
as
begin
	update KHACHHANG
	set TEN = @vTEN, THONGTIN = @vTHONGTIN, TINHTRANG = @vTINHTRANG
	where MAKH = @vMAKH
end
go

create procedure Customer_Lock @vMAKH INT,@vTINHTRANG INT
as
begin
	update KHACHHANG
	set TINHTRANG=@vTINHTRANG
	where MAKH = @vMAKH
end
go
--
create procedure Customer_Search @vMAKH INT
as
begin
	select * from KHACHHANG
	where MAKH = @vMAKH
end
go
