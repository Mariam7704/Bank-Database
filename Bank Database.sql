CREATE TABLE branch(
    branch_id CHAR(3) PRIMARY KEY,
    branch_address VARCHAR2(100));

CREATE TABLE employee(
    emp_id CHAR(4) PRIMARY KEY,
    emp_name VARCHAR2(50),
    emp_phone_number CHAR(14),
    emp_email VARCHAR2(50),
    emp_address VARCHAR2(50),
    emp_dob DATE,
    emp_salary NUMBER(6,1),
    br_id CHAR(3),
    CONSTRAINT works_in FOREIGN KEY(br_id) REFERENCES branch(branch_id));

CREATE TABLE credit_card (
    credit_card_id CHAR(16) PRIMARY KEY,
    card_security_number CHAR(4),
    card_limit NUMBER(5,0),
    expiry_date DATE);

CREATE TABLE account(
    account_id CHAR(18) PRIMARY KEY,
    balance NUMBER(9,1),
    category VARCHAR2(10),
    card_id CHAR(16),
    CONSTRAINT associated_with FOREIGN KEY(card_id) REFERENCES credit_card(credit_card_id));

CREATE TABLE client(
    client_id CHAR(18) PRIMARY KEY,
    client_name VARCHAR2(50),
    client_phone_number CHAR(14),
    client_address VARCHAR2(100),
    client_email VARCHAR2(50),
    client_dob DATE,
    acc_id CHAR(18),
    c_id CHAR(16),
    br_id CHAR(3),
    CONSTRAINT has_account FOREIGN KEY(acc_id) REFERENCES account(account_id),
    CONSTRAINT has_card FOREIGN KEY(c_id) REFERENCES credit_card(credit_card_id),
    CONSTRAINT served_in FOREIGN KEY(br_id) REFERENCES branch(branch_id));

INSERT INTO branch VALUES('001','123 Main Street, California');
INSERT INTO branch VALUES('002','789 Ocean Avenue, Florida');

INSERT INTO employee VALUES('1235','Arthur Morgan','(555) 987-6543','Arthur2@gmail.com','546 Willow street, California','02-May-1987',16000.0,'001');
INSERT INTO employee VALUES('1236','Ryan Gosling','(555) 123-4567','Ryan3@gmail.com','785 Pine Lane, Florida','15-Nov-1986',18000.0,'002');

INSERT INTO credit_card VALUES('4929128474523956','1234','20000','17-Feb-2028');
INSERT INTO credit_card VALUES('4929128474523957','5678','70000','20-Sep-2027');

INSERT INTO account VALUES ('874231059753684919','2000546.0','Savings','4929128474523956');
INSERT INTO account VALUES ('874231059753684920','78945612.0','Business','4929128474523957');

INSERT INTO client VALUES ('721894305671829043','Tony Montana','(555) 555-1212','123 Sunshine Boulevard, Florida','Tony1@gmail.com','25-Apr-1940','874231059753684920','4929128474523957','002');
INSERT INTO client VALUES ('492185073684920154','Vincent Vega','(555) 867-5309','234 Oak Street, California','Vincent5@gmail.com','15-Oct-1956','874231059753684919','4929128474523956','001');

