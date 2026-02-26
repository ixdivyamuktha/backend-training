create database payment_services;
use payment_services
create table Orders (
    id           int identity(1,1) primary key,
    user_id      int           not null,
    order_amount decimal(10,2) not null,
    order_status varchar(20)   not null,   
    created_at   datetime      not null default getdate(),
    updated_at   datetime      not null default getdate()
);

create table Payments (
    id                   int identity(1,1) primary key,
    order_id             int           not null foreign key references Orders(id),
    user_id              int           not null,
    payment_method       varchar(20)   not null,  
    amount               decimal(10,2) not null,
    status               varchar(20)   not null, 
    transaction_id       varchar(100)  null,       
    gateway_reference_id varchar(100)  null,
    is_cod               bit           not null default 0,
    created_at           datetime      not null default getdate(),
    updated_at           datetime      not null default getdate()
);

-- only one success payment per order
/*create unique index ux_payments_onesuccessperorder
on Payments(order_id)
where status = 'SUCCESS';*/

create table Refunds (
    id                    int identity(1,1) primary key,
    payment_id            int           not null foreign key references Payments(id),
    refund_amount         decimal(10,2) not null,
    status                varchar(20)   not null,   
    refund_transaction_id varchar(100)  not null,
    refund_reason         varchar(200)  null,
    created_at            datetime      not null default getdate(),
    updated_at            datetime      not null default getdate()
);

create table Payment_Attempts (
    id                       int identity(1,1) primary key,
    payment_id               int           not null foreign key references Payments(id),
    attempt_number           int           not null,
    gateway_request_payload  varchar(1000) null,
    gateway_response_payload varchar(1000) null,
    status                   varchar(20)   not null, 
    gateway_reference_id     varchar(100)  null,
    created_at               datetime      not null default getdate()
);

create table Refund_Attempts (
    id                       int identity(1,1) primary key,
    refund_id                int           not null foreign key references Refunds(id),
    gateway_reference_id     varchar(100)  null,
    status                   varchar(20)   not null,
    gateway_request_payload  varchar(1000) null,
    gateway_response_payload varchar(1000) null,
    created_at               datetime      not null default getdate()
);

create table Payment_Audit_Logs (
    id           int identity(1,1) primary key,
    entity_type  varchar(20)   not null, 
    entity_id    int           not null,
    action       varchar(50)   not null,  
    old_value    varchar(1000) null,
    new_value    varchar(1000) null,
    performed_by int           null,
    created_at   datetime      not null default getdate()
);
insert into Orders (user_id, order_amount, order_status)
values
(1, 500.00,  'PLACED'),    
(2, 300.00,  'PLACED'),    
(3, 400.00,  'CANCELLED'), 
(4, 1500.00, 'PLACED'),    
(5, 800.00,  'PLACED');    

insert into Payments (order_id, user_id, payment_method, amount, status,
                      transaction_id, gateway_reference_id, is_cod)
values (1, 1, 'UPI', 500.00, 'SUCCESS', 'UPI-TXN-001', 'GATE-REF-001', 0);

insert into Payments (order_id, user_id, payment_method, amount, status,
                      transaction_id, gateway_reference_id, is_cod)
values (2, 2, 'CARD', 300.00, 'FAILED', 'CARD-TXN-001', 'GATE-REF-002', 0);

insert into Payments (order_id, user_id, payment_method, amount, status,
                      transaction_id, gateway_reference_id, is_cod)
values (2, 2, 'CARD', 300.00, 'SUCCESS', 'CARD-TXN-002', 'GATE-REF-003', 0);

insert into Payments (order_id, user_id, payment_method, amount, status,
                      is_cod)
values (4, 4, 'COD', 1500.00, 'PENDING', 1);
update Payments
set status = 'SUCCESS',
    updated_at = sysdatetime(),
    transaction_id = 'COD-TXN-004'
where order_id = 4 and is_cod = 1; 

insert into Payments (order_id, user_id, payment_method, amount, status,
                      transaction_id, gateway_reference_id, is_cod)
values (1, 1, 'CARD', 500.00, 'SUCCESS', 'CARD-TXN-999', 'GATE-REF-999', 0);

insert into Payments (order_id, user_id, payment_method, amount, status,
                      transaction_id, gateway_reference_id, is_cod)
values (3, 3, 'UPI', 400.00, 'PENDING', 'UPI-TXN-003', 'GATE-REF-004', 0);
insert into Refunds (payment_id, refund_amount, status, refund_transaction_id, refund_reason)
values (3, 300.00, 'SUCCESS', 'REF-TXN-001', 'Order cancelled before preparation');

insert into Refunds (payment_id, refund_amount, status, refund_transaction_id, refund_reason)
values (4, 200.00, 'SUCCESS', 'REF-TXN-002', 'Item missing');

insert into Refunds (payment_id, refund_amount, status, refund_transaction_id, refund_reason)
values (1, 600.00, 'INITIATED', 'REF-TXN-999', 'Test');
select top 5 order_id, user_id, amount,status,payment_method from Payments where status = 'SUCCESS' order by amount desc;
select status, count(*) as count_payments from Payments where status in ('SUCCESS', 'FAILED') group by status;
select isnull(sum(amount), 0) as total_amount_today from Payments where status = 'SUCCESS' and convert(date, created_at) = convert(date, getdate());
select * from Payments where payment_method = 'UPI';
select isnull(sum(refund_amount), 0) as total_refund_amount from Refunds where status = 'SUCCESS';