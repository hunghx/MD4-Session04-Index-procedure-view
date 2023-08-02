-- Chỉ mục (Index) 
create index index_tenkh on khachhang(tenkh);
-- truy vấn dữ liệu khi chưa đánh index 
explain analyze  select * from khachhang where tenkh = "Le Thi F";
-- '-> Filter: (khachhang.tenkh = \'Le Thi F\')  (cost=0.55 rows=1) (actual time=0.0374..0.0414 rows=1 loops=1)\n    -> Table scan on khachhang  (cost=0.55 rows=3) (actual time=0.0313..0.0368 rows=3 loops=1)\n'
-- '-> Index lookup on khachhang using index_tenkh (tenkh=\'Le Thi F\')  (cost=0.35 rows=1) (actual time=0.0241..0.0258 rows=1 loops=1)\n'
 
-- Thủ tục lưu trữ : Stored Procedures
-- khai báo
delimiter //
create procedure PROC_INSERT_TO_KH(ma_kh varchar(4),ten_kh varchar(30), dia_chi varchar(50),ngay_sinh date,so_dt varchar(15))
begin
	INSERT INTO KHACHHANG (makh,tenkh,diachi,ngaysinh,sodt) values(ma_kh,ten_kh,dia_chi,ngay_sinh,so_dt);
end;
// delimiter ;

-- thực thi 
CALL PROC_INSERT_TO_KH("S099","Hồ Xuân Hùng","Hà Nội","1999-05-10","0987654321");
CALL PROC_INSERT_TO_KH("S099","Hồ Xuân Hùng","Hà Nội","1999-05-10","0987654321");
CALL PROC_INSERT_TO_KH("S099","Hồ Xuân Hùng","Hà Nội","1999-05-10","0987654321");
CALL PROC_INSERT_TO_KH("S099","Hồ Xuân Hùng","Hà Nội","1999-05-10","0987654321");
CALL PROC_INSERT_TO_KH("S099","Hồ Xuân Hùng","Hà Nội","1999-05-10","0987654321");
CALL PROC_INSERT_TO_KH("S099","Hồ Xuân Hùng","Hà Nội","1999-05-10","0987654321");
CALL PROC_INSERT_TO_KH("S099","Hồ Xuân Hùng","Hà Nội","1999-05-10","0987654321");
CALL PROC_INSERT_TO_KH("S099","Hồ Xuân Hùng","Hà Nội","1999-05-10","0987654321");
CALL PROC_INSERT_TO_KH("S099","Hồ Xuân Hùng","Hà Nội","1999-05-10","0987654321");
CALL PROC_INSERT_TO_KH("S099","Hồ Xuân Hùng","Hà Nội","1999-05-10","0987654321");
--  tạo 3 procedure làm các chức năng sửa , xóa và truy vấn toàn bộ dữ liệu của bảng khachhang
delimiter //
create procedure PROC_UPDATE_ON_KH(ma_kh varchar(4),ten_kh varchar(30), dia_chi varchar(50),ngay_sinh date,so_dt varchar(15))
begin
	UPDATE KHACHHANG SET tenkh= ten_kh,diachi=dia_chi,ngaysinh=ngay_sinh, sodt=so_dt WHERE makh = ma_kh;
end;
// delimiter ; 
call PROC_UPDATE_ON_KH("S099","Nguyễn Văn Minh","Hà Nội","1998-05-10","0987654838");

delimiter //
create procedure PROC_DELETE_ON_KH(ma_kh varchar(4))
begin
	DELETE FROM KHACHHANG WHERE makh = ma_kh;
end;
// delimiter ; 
call PROC_DELETE_ON_KH("S099");



delimiter //
create procedure PROC_SELECT_ON_KH()
begin
	select * from KHACHHANG;
end;
// delimiter ; 

call PROC_SELECT_ON_KH();