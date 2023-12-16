create database Student;
use Student;

 
 create Table studentadmissionpaymentdetails(
 rollno decimal(10,0),
 amountpaid decimal(10,0),
 balance decimal(10,0),
 paymentnum decimal(10,0),
 paiddate date,
 feecollectorname varchar(100));
 
 
 create Table studentsubjectinformation(
 subopted varchar(100),
 rollno decimal(10,0),
 totalmarks decimal(10,0),
 obtainedmarks decimal(10,0),
 percentage decimal(3,2));
 
 create Table studentscholarshipinformation(
 rollno decimal(10,0),
 scholarshipname varchar(100),
 schdescription varchar(100),
 schamount decimal(10,0),
 schcategory varchar(100));
 
 
 
 create Table studentbasicinformation(
 name varchar(100),
 surname varchar(100),
 rollno decimal(10,0),
 address varchar(100),
 phno decimal(10,0),
 state varchar(100),
 city varchar(100));
 
 insert INTO studentbasicinformation values("a","b",1,"c",1234567891,"ap","nrt");
 insert INTO studentbasicinformation values("d","e",2,"f",1234597891,"ap","gnt");
 insert INTO studentbasicinformation values("g","h",3,"i",1234367891,"Tel","hyd");
 insert INTO studentbasicinformation values("j","k",4,"l",1237567891,"kar","ban");
 insert INTO studentbasicinformation values("m","n",5,"o",1234567891,"kar","cessna");
 insert INTO studentbasicinformation values("p","q",6,"r",1034567891,"up","delhi");
 insert INTO studentbasicinformation values("s","t",7,"u",1934567891,"up","lucknow");
 insert INTO studentbasicinformation values("v","w",8,"x",1264567891,"tel","kamammam");
 insert INTO studentbasicinformation values("y","z",9,"ab",9234567891,"ap","nrt");
 insert INTO studentbasicinformation values("cd","ef",10,"gh",1234567899,"guj","sudan");
 
 
 alter table studentsubjectinformation drop column percentage;
 alter table studentsubjectinformation add column percentage decimal(5,2);
 
 insert INTO studentsubjectinformation values("science",1,100,90,90.0);
 insert INTO studentsubjectinformation values("english",2,100,70,70.0);
 insert INTO studentsubjectinformation values("maths",1,100,80,80.0);
 insert INTO studentsubjectinformation values("social",2,100,60,60.0);
 insert INTO studentsubjectinformation values("science",3,100,70,70.0);
 insert INTO studentsubjectinformation values("telugu",4,100,91,91.0);
 insert INTO studentsubjectinformation values("hindi",5,100,56,56.0);
 insert INTO studentsubjectinformation values("science",4,100,30,30.0);
 insert INTO studentsubjectinformation values("maths",3,100,99,99.0);
 insert INTO studentsubjectinformation values("social",6,100,90,90.0);
insert INTO studentsubjectinformation values("geography",7,100,40,40.0);
insert INTO studentsubjectinformation values("arts",8,100,80,80.0);
insert INTO studentsubjectinformation values("telugu",9,100,99,99.0);
insert INTO studentsubjectinformation values("science",10,100,90,90.0);
   
insert INTO studentadmissionpaymentdetails values(1,20000,30000,123,"2023-11-21","raju");
insert INTO studentadmissionpaymentdetails values(2,22000,28000,121,"2023-10-21","raju");
insert INTO studentadmissionpaymentdetails values(3,10000,40000,124,"2023-9-21","raju");
insert INTO studentadmissionpaymentdetails values(4,0,50000,128,"2023-11-20","raju");
insert INTO studentadmissionpaymentdetails values(5,40000,10000,153,"2023-1-2","raju");
insert INTO studentadmissionpaymentdetails values(6,22000,28000,173,"2023-12-2","raju");
insert INTO studentadmissionpaymentdetails values(7,10000,40000,193,"2023-3-21","rajesh");
insert INTO studentadmissionpaymentdetails values(8,0,50000,323,"2023-4-21","raju");
insert INTO studentadmissionpaymentdetails values(9,40000,10000,223,"2023-2-1","raju");
insert INTO studentadmissionpaymentdetails values(10,25000,25000,823,"2023-7-1","raju");

  insert INTO studentscholarshipinformation values(1,"kjsm","scholarship",10000,"merit");
   insert INTO studentscholarshipinformation values(3,"kjsm","scholarship",120000,"merit");
    insert INTO studentscholarshipinformation values(5,"kjss","scholarship",20000,"sports");
     insert INTO studentscholarshipinformation values(6,"kjsk","scholarship",5000,"poor");
      insert INTO studentscholarshipinformation values(9,"kjsk","scholarship",10000,"poor");
       insert INTO studentscholarshipinformation values(10,"kjsm","scholarship",10000,"merit");
       
       
select * from studentscholarshipinformation;
select * from studentadmissionpaymentdetails;
select * from studentsubjectinformation;
select * from studentbasicinformation;

update studentscholarshipinformation set scholarshipname="kjsp" WHERE rollno=1;

select a.*,b.schamount from studentbasicinformation a inner join studentscholarshipinformation b on a.rollno=b.rollno where b.schamount>5000;

select * from studentbasicinformation where rollno not in (select rollno from studentscholarshipinformation);

create view Balance as
select a.*, b.balance from studentbasicinformation a inner join studentadmissionpaymentdetails b on a.rollno=b.rollno where b.balance>0; 


select * from studentbasicinformation where rollno in (select rollno from studentsubjectinformation order by percentage desc limit 5);
select schcategory from studentscholarshipinformation group by schcategory order by count(schcategory) desc limit 1;
select count(schcategory),schcategory from studentscholarshipinformation group by schcategory order by count(schcategory) desc;

select * from studentbasicinformation where rollno=(select rollno from studentscholarshipinformation where schamount=(select  max(schamount) from studentscholarshipinformation) );