CREATE DATABASE recruitment_portal;

CREATE TABLE users (
    userid SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

CREATE TABLE company (
    companyid SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    location VARCHAR(100),
    password VARCHAR(100)
);

CREATE TABLE admin (
    adminid SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100)
);

CREATE TABLE job (
    jobid SERIAL PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    skill VARCHAR(100),
    companyid INT REFERENCES company(companyid)
);

CREATE TABLE application (
    applicationid SERIAL PRIMARY KEY,
    userid INT REFERENCES users(userid),
    jobid INT REFERENCES job(jobid),
    status VARCHAR(50)
);

CREATE TABLE interview (
    interviewid SERIAL PRIMARY KEY,
    applicationid INT REFERENCES application(applicationid),
    date DATE,
    time VARCHAR(20),
    mode VARCHAR(50)
);

CREATE TABLE job_offer (
    offerid SERIAL PRIMARY KEY,
    applicationid INT REFERENCES application(applicationid),
    salary DOUBLE PRECISION,
    joining_date DATE,
    offer_status VARCHAR(50)
);

-- preload jobs
INSERT INTO job (title, description, skill, companyid) VALUES
('Java Developer','Backend dev','Java',1),
('Python Dev','ML work','Python',1),
('Frontend Dev','UI','HTML',1),
('Tester','QA','Testing',1),
('DB Admin','DB work','PostgreSQL',1),
('Android Dev','Mobile','Android',1),
('Data Analyst','Data','SQL',1),
('Cloud Engineer','AWS','Cloud',1);

 select*from company( companyid, name, email,location) values (1, 'ABC TECH','abc@company.com','Pune');

 INSERT INTO company (name, email, location, password)
VALUES ('Default Company', 'company@test.com', 'Pune', 'company');

INSERT INTO job (title, description, skill, companyid) VALUES
('Java Developer','Backend dev','Java',1),
('Python Dev','ML work','Python',1),
('Frontend Dev','UI','HTML',1),
('Tester','QA','Testing',1),
('DB Admin','DB work','PostgreSQL',1),
('Android Dev','Mobile','Android',1),
('Data Analyst','Data','SQL',1),
('Cloud Engineer','AWS','Cloud',1);

INSERT INTO admin (name, email, password)
VALUES ('Admin', 'admin@test.com', 'admin');

SELECT
    u.name AS user_name,
    j.title AS job_title,
    c.name AS company_name,
    a.status AS application_status,
    u.name AS interview_date
FROM application a
JOIN users u ON a.userid = u.userid
JOIN job j ON a.jobid = j.jobid
JOIN company c ON j.companyid = c.companyid
LEFT JOIN interview i ON a.applicationid = i.applicationid;

SELECT table_name
FROM information_schema.views
WHERE table_name = 'your_view_name';

UPDATE users
SET name = CASE userid
    WHEN 1 THEN 'Amit Sharma'
    WHEN 2 THEN 'Priya Singh'
    WHEN 3 THEN 'Rahul Verma'
    WHEN 4 THEN 'Neha Patil'
    WHEN 5 THEN 'Suresh Kumar'
    WHEN 6 THEN 'Anjali Mehta'
    WHEN 7 THEN 'Vikas Joshi'
    WHEN 8 THEN 'Pooja Nair'
END
WHERE userid IN (1,2,3,4,5,6,7,8);

SELECT
    u.name AS user_name,
    j.title AS job_title,
    c.name AS company_name,
    a.status AS application_status,
    u.name AS interview_date,
    i.mode AS interview_mode,
    o.salary,
    o.offer_status
FROM application a
JOIN users u ON a.userid = u.userid
JOIN job j ON a.jobid = j.jobid
JOIN company c ON j.companyid = c.companyid
LEFT JOIN interview i ON a.applicationid = i.applicationid
LEFT JOIN job_offer o ON a.applicationid = o.applicationid;

SELECT
    u.name AS user_name,
    j.title AS job_title,
    c.name AS company_name,
    a.status AS application_status,
    u.name AS interview_date,
    i.mode AS interview_mode,
    o.salary,
    o.offer_status
FROM application a
JOIN users u ON a.userid = u.userid
JOIN job j ON a.jobid = j.jobid
JOIN company c ON j.companyid = c.companyid
LEFT JOIN interview i ON a.applicationid = i.applicationid
LEFT JOIN job_offer o ON a.applicationid = o.applicationid;

UPDATE application
SET status = 'Interviewed'
WHERE applicationid IN (1,2,3,4,5);

UPDATE application
SET status = 'Offered'
WHERE applicationid IN (1,2,3);

select*from application where applicationid=1;
select applicationid 

INSERT INTO job_offer (applicationid, salary, joining_date, offer_status) VALUES
(1, 600000, '2026-02-01', 'Offered'),
(2, 750000, '2026-02-10', 'Accepted'),
(3, 500000, '2026-02-15', 'Pending'),
(4, 450000, '2026-02-20', 'Rejected');

INSERT INTO interview (applicationid, interview_date, interview_Time, mode) VALUES
(1, '2026-01-15', '10:00 AM', 'Online'),
(2, '2026-01-16', '11:30 AM', 'Offline'),
(3, '2026-01-17', '02:00 PM', 'Online'),
(4, '2026-01-18', '01:00 PM', 'Offline'),
(5, '2026-01-19', '03:00 PM', 'Online');

INSERT INTO application (userid, jobid, status) VALUES
(1, 1, 'Applied'),
(2, 2, 'Applied'),
(3, 3, 'Applied'),
(4, 4, 'Applied'),
(5, 5, 'Applied'),
(6, 6, 'Applied'),
(7, 7, 'Applied'),
(8, 8, 'Applied');

INSERT INTO users (name, email, password) VALUES
('Amit Sharma', 'amit@test.com', 'amit123'),
('Priya Singh', 'priya@test.com', 'priya12'),
('Rahul Verma', 'rahul@test.com', 'rahul01'),
('Neha Patil', 'neha@test.com', 'neha123'),
('Suresh Kumar', 'suresh@test.com', 'suresh1'),
('Anjali Mehta', 'anjali@test.com', 'anjali1'),
('Vikas Joshi', 'vikas@test.com', 'vikas12'),
('Pooja Nair', 'pooja@test.com', 'pooja11');

SELECT 
    u.name AS user_name,
    j.title AS job_title,
    a.status AS application_status,
    o.salary,
    o.offer_status
FROM application a
JOIN users u ON a.userid = u.userid
JOIN job j ON a.jobid = j.jobid
LEFT JOIN job_offer o ON a.applicationid = o.applicationid;

INSERT INTO job_offer (applicationid, salary, joining_date, offer_status) VALUES
(1, 600000, '2026-02-01', 'Offered'),
(2, 750000, '2026-03-01', 'Accepted'),
(3, 500000, '2026-01-20', 'Pending'),
(4, 900000, '2026-04-10', 'Offered'),
(5, 450000, '2026-02-15', 'Rejected');

INSERT INTO company (name, email, location, password) VALUES
('TechSoft', 'techsoft@test.com', 'Pune', 'tech123'),
('InnovaIT', 'innovait@test.com', 'Mumbai', 'innova1'),
('CloudNine', 'cloud9@test.com', 'Bangalore', 'cloud99'),
('NextGen', 'nextgen@test.com', 'Hyderabad', 'nextgen'),
('DataWorks', 'data@test.com', 'Chennai', 'data123'),
('WebCraft', 'web@test.com', 'Delhi', 'webcraft'),
('Appify', 'appify@test.com', 'Noida', 'appify1'),
('CyberSys', 'cyber@test.com', 'Gurgaon', 'cyber12');

ALTER TABLE users
ALTER COLUMN password TYPE VARCHAR(8);

ALTER TABLE company
ALTER COLUMN password TYPE VARCHAR(8);

ALTER TABLE admin
ALTER COLUMN password TYPE VARCHAR(8);