INSERT INTO dept(
    dept
)
VALUES
('ADMINISTRATION'),
('MARKETING'),
('SALES');

INSERT INTO employee(first_name, last_name, title, emp_num, dept_id, emp_tier, salary, date_hired, emp_status)
VALUES
('SATCHEL', 'PAGE', 'OWNER', 6032001, 1, 3, 105000, '2017-10-23', 1),
("D'EBONIE", 'WEEMS', 'OFFICE MANAGER', 6032002, 1, 2, 85000, '2017-10-23', 1),
('JORDAN', 'WALLACE', 'CUSTOMER SERVICE REP', 6032003, 3, 1, 45000, '2021-07-10', 1),
('JANAE', 'TEACHEY', 'CUSTOMER SERVICE REP', 6032004, 2, 1, 64000, '2023-07-19', 1), 
('ETHAN', 'DANIELS', 'SALES MANAGER', 6032005, 3, 2, 80000, '2018-06-24', 1),
('FABIAN', 'HILL', 'MARKETING MANAGER', 6032006, 2, 2, 80000, '2019-07-11', 1),
('KATELYN', 'NGUYEN', 'CUSTOMER SERVICE REP', 6032007, 3, 1, 50000, '2020-06-24', 1),
('VERIES', 'SEALS', 'MARKETING REP', 6032008, 2, 1,  64000, '2022-08-10', 1),
('RISHARD', 'BELL', 'CUSTOMER SERVICE REP', 6032009, 3, 1, 50000, '2017-11-01', 1),
('ZANDRYA', 'GABRIS', 'BOOKKEEPER', 6032010, 1, 1, 37500, '2018-09-05', 1);

INSERT INTO transaction( 
    employee_id,
    products_sold,
    amount,
    transaction_date
)
VALUES
(3, 4, 117.45, '2025-03-17 00:00:00'),
(3, 2, 56.35, '2025-03-17 00:00:00'),
(7, 1, 48.45, '2025-03-17 00:00:00'),
(9, 7, 318.85, '2025-03-17 00:00:00'),
(9, 3, 118.78, '2025-03-17 00:00:00'),
(7, 2, 27.67, '2025-03-17 00:00:00'),
(9, 1, 67.44, '2025-03-17 00:00:00'),
(3, 4, 176.98, '2025-03-17 00:00:00'),
(3, 5, 367.9, '2025-03-17 00:00:00'),
(7, 3, 112.28, '2025-03-18 00:00:00'),
(7, 1, 39.82, '2025-03-18 00:00:00'),
(7, 6, 212.56, '2025-03-18 00:00:00'),
(3, 3, 98.18, '2025-03-18 00:00:00'),
(9, 1, 67.44, '2025-03-18 00:00:00'),
(3, 1, 48.45, '2025-03-18 00:00:00'),
(7, 8, 429.98, '2025-03-18 00:00:00'),
(3, 3, 125.87, '2025-03-18 00:00:00'),
(9, 4, 162.45, '2025-03-19 00:00:00'),
(9, 2, 27.67, '2025-03-19 00:00:00'),
(7, 6, 219.67, '2025-03-19 00:00:00'),
(3, 2, 88.34, '2025-03-19 00:00:00'),
(7, 5, 312.34, '2025-03-19 00:00:00'),
(3, 1, 39.82, '2025-03-19 00:00:00'),
(9, 1, 63.98, '2025-03-19 00:00:00'),
(3, 5, 275.45, '2025-03-20 00:00:00'),
(3, 2, 55.24, '2025-03-20 00:00:00'),
(9, 3, 79.63, '2025-03-20 00:00:00'),
(7, 2, 55.24, '2025-03-20 00:00:00'),
(7, 2, 27.67, '2025-03-20 00:00:00'),
(7, 2, 79.65, '2025-03-20 00:00:00'),
(9, 1, 67.44, '2025-03-20 00:00:00'),
(7, 5, 312.34, '2025-03-20 00:00:00'),
(3, 5, 384.87, '2025-03-21 00:00:00'),
(9, 3, 227.32, '2025-03-21 00:00:00'),
(7, 1, 39.82, '2025-03-21 00:00:00'),
(7, 6, 144.12, '2025-03-21 00:00:00');

INSERT INTO contract(
    employee_id,
    client,
    amount,
    contract_date,
    completion_date
) 
VALUES
(4, 'JANJALA DURR', 4500, '2025-03-17', '2025-09-17'),
(8, 'WILL BRIDGES', 10000, '2025-03-17', '2026-03-17'),
(8, 'CLINT JACKSON', 7500, '2025-03-18', '2025-09-18'),
(4, 'RENEE PALMETER', 4500, '2025-03-18', '2025-09-18'),
(4, 'MARY SHIELDS', 12000, '2025-03-19', '2026-03-19'),
(8, 'JUSTIN ARNOLD', 5500, '2025-03-19', '2025-09-19'),
(4, 'FAVOR SMITH', 7500, '2025-03-20', '2025-09-20'),
(8, 'EZEKIEL CARY', 3500, '2025-03-20', '2025-09-20');

--1
SELECT first_name, last_name FROM employee WHERE (date_hired < '2020-12-31');
--2
SELECT first_name, last_name FROM employee WHERE (dept_id = 2);
--3
SELECT first_name, last_name, title FROM employee WHERE (salary > 40000 AND salary < 80000);
--4
SELECT sum(products_sold) FROM transaction;
--5
SELECT  sum(t.products_sold), e.first_name, e.last_name FROM transaction t
JOIN employee e using (employee_id)
GROUP BY employee_id, e.first_name, e.last_name
;
--6
SELECT first_name, last_name, total FROM employee
JOIN 
(SELECT sum(amount) total, employee_id FROM transaction
GROUP BY employee_id) t
USING (employee_id);
--7
SELECT sum(amount) total, transaction_date date FROM transaction
WHERE (transaction_date = '2025-03-19 00:00:00');
--8
SELECT sum(amount) total FROM contract;
--9
SELECT first_name, last_name, total FROM employee
JOIN
(SELECT sum(amount) total, employee_id FROM contract
GROUP BY employee_id) t
USING (employee_id);
--10 I already did that in 9
--11
SELECT contract_id, client FROM contract 
WHERE (completion_date > '2025-12-31');
--12


