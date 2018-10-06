DROP TABLE IF EXISTS
    payment;
DROP TABLE IF EXISTS
    expenses;

CREATE TABLE payment(
    pay_id INT(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    res_id VARCHAR(5) NOT NULL UNIQUE KEY,
    pay_method VARCHAR(16) NOT NULL DEFAULT 'Credit Card',
    amount DOUBLE NOT NULL,
    pay_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_payment_rid FOREIGN KEY(res_id) REFERENCES reservation(res_id)
);
CREATE TABLE expenses(
    exp_id INT(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    amount DOUBLE NOT NULL,
    date_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
DROP VIEW IF EXISTS
    payment_res_event;
CREATE VIEW payment_res_event AS
SELECT
    p.pay_id,
    p.res_id,
    e.event_Id,
    c.cus_id,
    p.amount,
    p.pay_method,
    p.pay_date AS pay_date,
    r.date AS res_date,
    e.date AS event_date,
    e.event_name,
    c.name AS cus_name
FROM
    ((payment p
JOIN public_events e)
JOIN reservation r)
JOIN customer c WHERE
    p.res_id = r.res_id AND e.event_id = r.event_id AND r.cus_id = c.cus_id;


DROP TABLE IF EXISTS expenses;

CREATE TABLE `expenses` (
  `exp_id` int(8) UNSIGNED ZEROFILL NOT NULL PRIMARY KEY,
  `dept` varchar(16) NOT NULL,
  `description` text NOT NULL,
  `method` varchar(12) NOT NULL,
  `amount` double NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
