drop table if exists payment;
drop table if exists expenses;

create table payment(
  pay_id      int(8)      unsigned zerofill not null auto_increment primary key,
  res_id      varchar(5)  not null unique key,
  pay_method  varchar(16) not null default 'Credit Card',
  amount      double      not null,
  date_time   datetime    not null default current_timestamp,
  constraint fk_payment_rid foreign key (res_id) references reservation (res_id)
);

create table expenses(
  exp_id int(8) unsigned zerofill not null auto_increment primary key,
  description   text,
  amount      double      not null,
  date_time   datetime    not null default current_timestamp,
);

drop view if exists payment_event_res;
create view payment_event_res
as
select p.pay_id, p.res_id, e.event_Id, p.amount, p.method,
  p.date_time as pay_date,
  r.date as res_date,
  e.date as event_date
from  (payment p join public_events e) join reservation r
where p.res_id = r.res_id and e.event_id = r.event_id;

