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

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create procedure SIM_Load
as
begin
	select * from THONGTINSIM
end
go
--
create procedure SIM_Add @vSODT NVARCHAR(100),@vMAKH INT,@vTINHTRANG INT
as
begin
	insert into THONGTINSIM(SODT,MAKH,TINHTRANG)
	values(@vSODT,@vMAKH,@vTINHTRANG)
end
go
--
create procedure SIM_Update @vMASIM INT,@vSODT NVARCHAR(100),@vMAKH INT,@vTINHTRANG INT
as
begin
	update THONGTINSIM
	set SODT = @vSODT, MAKH = @vMAKH, TINHTRANG = @vTINHTRANG
	where MASIM = @vMASIM
end
go

create procedure SIM_Lock @vMASIM INT,@vTINHTRANG INT
as
begin
	update THONGTINSIM
	set TINHTRANG=@vTINHTRANG
	where MASIM = @vMASIM
end
go
--
create procedure SIM_Search @vMAKH INT
as
begin
	select * from THONGTINSIM
	where MAKH = @vMAKH
end
go
--
create procedure SIM_combobox_MAKH 
as
begin
	select * from KHACHHANG
end
go
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create procedure HoaDonDangKy_Load
as
begin
	select * from HOADONDANGKI
end
go
--
create procedure HoaDonDangKy_Add @vMASIM int,@vPHIDANGKI money,@vNGAYDANGKI datetime
as
begin
	insert into HOADONDANGKI(MASIM,PHIDANGKI,NGAYDANGKI)
	values(@vMASIM,@vPHIDANGKI,@vNGAYDANGKI)
end
go
--
create procedure HoaDonDangKy_Update @vMAHDDK int,@vMASIM int,@vPHIDANGKI money,@vNGAYDANGKI datetime
as
begin
	update HOADONDANGKI
	set MASIM = @vMASIM,  PHIDANGKI = @vPHIDANGKI, NGAYDANGKI = @vNGAYDANGKI
	where MAHDDK = @vMAHDDK
end
go

create procedure HoaDonDangKy_Delete @vMAHDDK INT
as
begin
	delete from HOADONDANGKI
	where MAHDDK = @vMAHDDK
end
go
--
create procedure HoaDonDangKy_Search @vMAHDDK INT
as
begin
	select * from HOADONDANGKI
	where MAHDDK = @vMAHDDK
end
go
--
create procedure HoaDonDangKy_combobox_MASIM
as
begin
	select * from THONGTINSIM
end
go

-- report

create PROCEDURE Report_HoaDonDangKy @vMaHDDK int
AS
BEGIN
		SELECT KHACHHANG.MAKH, TEN, THONGTINSIM.MASIM, SODT,NGAYDANGKI,PHIDANGKI
		FROM KHACHHANG, THONGTINSIM, HOADONDANGKI
		WHERE KHACHHANG.MAKH = THONGTINSIM.MAKH AND THONGTINSIM.MAKH = HOADONDANGKI.MASIM
			  AND MAHDDK = @vMaHDDK
end
go

create PROCEDURE ChiTietSuDung_Count_Sim
AS
BEGIN
		select count (MASIM)
		from THONGTINSIM
end
go

Report_HoaDonDangKy 1