DROP TABLE IF EXISTS
    payment;
DROP TABLE IF EXISTS
    expenses;
CREATE TABLE payment(
    pay_id INT(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    res_id VARCHAR(5) NOT NULL UNIQUE KEY,
    pay_method VARCHAR(16) NOT NULL DEFAULT 'Credit Card',
    amount DOUBLE NOT NULL,
    date_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
    p.amount,
    p.pay_method,
    p.date_time AS pay_date,
    r.date AS res_date,
    e.date AS event_date
    e.event_name
FROM
    (payment p
JOIN public_events e)
JOIN reservation r WHERE
    p.res_id = r.res_id AND e.event_id = r.event_id;