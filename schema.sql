DROP DATABASE IF EXISTS ssDB;
CREATE DATABASE ssDB;
USE ssDB;

CREATE TABLE dept(
    dept_id TINYINT UNSIGNED AUTO_INCREMENT NOT NULL,
    dept VARCHAR(40),
    CONSTRAINT pk_dept PRIMARY KEY (dept_id)
);

CREATE TABLE employee(
    employee_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    title VARCHAR(40),
    emp_num SMALLINT UNSIGNED NOT NULL,
    dept_id TINYINT UNSIGNED NOT NULL,
    emp_tier TINYINT UNSIGNED NOT NULL,
    salary MEDIUMINT UNSIGNED NOT NULL,
    date_hired date NOT NULL,
    emp_status TINYINT UNSIGNED NOT NULL,
    CONSTRAINT pk_employee PRIMARY KEY (employee_id),
    CONSTRAINT fk_dept FOREIGN KEY (dept_id)
    REFERENCES dept (dept_id)
);

CREATE TABLE transaction(
    transaction_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    employee_id SMALLINT UNSIGNED NOT NULL,
    products_sold SMALLINT UNSIGNED NOT NULL,
    amount DECIMAL(3,2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    CONSTRAINT pk_transaction PRIMARY KEY (transaction_id),
    CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);

CREATE TABLE contract(
    contract_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    employee_id SMALLINT UNSIGNED NOT NULL,
    client VARCHAR(40),
    amount SMALLINT UNSIGNED NOT NULL,
    contract_date DATE,
    completion_date DATE,
    CONSTRAINT pk_contract PRIMARY KEY (contract_id),
    CONSTRAINT fk_contract_employee FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);

ALTER TABLE employee
    MODIFY emp_num MEDIUMINT UNSIGNED;

ALTER TABLE transaction
    MODIFY amount DECIMAL(5,2) NOT NULL;