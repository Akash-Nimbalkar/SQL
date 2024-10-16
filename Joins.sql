CREATE TABLE employee (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10, 2),
    dept_id VARCHAR(10),
    manager_id VARCHAR(10)
);

INSERT INTO employee (emp_id, emp_name, salary, dept_id, manager_id) VALUES
('E1', 'Aarav', 50000, 'D1', 'M1'),
('E2', 'Vivaan', 60000, 'D1', 'M1'),
('E3', 'Aditya', 55000, 'D2', 'M2'),
('E4', 'Vihaan', 70000, 'D2', 'M2'),
('E5', 'Krishna', 65000, 'D3', 'M3'),
('E6', 'Ishaan', 58000, 'D3', 'M3');

INSERT INTO employee (emp_id, emp_name, salary, dept_id, manager_id) VALUES
('E7', 'Ram', 60000, 'D10', 'M2'),
('E8', 'Meghana', 50000, 'D15', 'M2');

CREATE TABLE department (
    dept_id VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO department (dept_id, dept_name) VALUES
('D1', 'IT'),
('D2', 'HR'),
('D3', 'Finance'),
('D4', 'Admin');


CREATE TABLE manager (
    manager_id VARCHAR(10) PRIMARY KEY,
    manager_name VARCHAR(50),
    dept_id VARCHAR(10)
);
INSERT INTO manager (manager_id, manager_name, dept_id) VALUES
('M1', 'Rahul', 'D1'),
('M2', 'Sita', 'D2'),
('M3', 'Anil', 'D3'),
('M4', 'Priya', 'D1');


CREATE TABLE projects (
    project_id VARCHAR(10),
    project_name VARCHAR(100),
    team_member_id VARCHAR(10)
);

INSERT INTO projects (project_id, project_name, team_member_id) VALUES
('P1', 'Data Visualization', 'E1'),
('P1', 'Data Visualization', 'E2'),
('P1', 'Data Visualization', 'M3'),
('P2', 'ETL Tool', 'E1'),
('P2', 'ETL Tool', 'M4');

CREATE TABLE Company (
    company_id INT,
    company_name VARCHAR(100),
    location VARCHAR(100)
);

INSERT INTO Company (company_id, company_name, location)
VALUES (1, 'TechCorp', 'New York');


CREATE TABLE Family (
    member_id VARCHAR(5),
    name VARCHAR(100),
    age INT,
    parent_id VARCHAR(5)
);

INSERT INTO Family (member_id, name, age, parent_id)
VALUES 
('F1', 'John', 50, 'F5'),        
('F2', 'Mary', 45, 'F5'),       
('F3', 'David', 25, 'F5'),       
('F4', 'Sarah', 48, NULL),       
('F5', 'Michael', 52, 'F6'),      
('F6', 'Alice', 30, NULL),        
('F7', 'Emma', 22, 'F4'),        
('F8', 'James', 28, 'F4');   



select * from employee;
select * from department;
select * from manager;
select * from projects;
select * from company;
select * from Family;


--Fetch employee name and department name they belong to
--INNER JOIN/ JOIN

select e.emp_name, d.dept_name 
from employee e 
JOIN department d ON e.dept_id=d.dept_id; 

--Fetch ALL employee name and department name they belong to
--LEFT JOIN

select e.emp_name, d.dept_name
from employee e
LEFT JOIN department d ON e.dept_id = d.dept_id;

--left join = inner join + include any additional record in left table which are not returned by inner join


--right join = inner join + include any additional record from right table which are not returned by inner join
select e.emp_name, d.dept_name
from employee e
RIGHT JOIN department d ON e.dept_id = d.dept_id;


--Fetch details of ALL employee, their manager, their department and the projects they work on
select e.emp_name, d.dept_name, m.manager_name, p.project_name
from employee e 
LEFT JOIN department d ON e.dept_id = d.dept_id
JOIN manager m on e.manager_id = m.manager_id
LEFT JOIN projects p on e.emp_id = p.team_member_id;

--Full join or Full outer join:
--full join = Inner join + left join + right join
select e.emp_name, d.dept_name
from employee e
FULL JOIN department d ON e.dept_id = d.dept_id; --One can write full outer join too. It means the same.

''' We can use any of the following terms
join == inner join
left join == left outer join
right join == right outer join
full join == full outer join'''


-- Cross join:
-- It return cartesian product of two tables
select e.emp_name, d.dept_name 
from employee e 
cross join department d;


-- Write a query to fetch employee name and their department name.
-- also make sure to display the company name and the company location corresponding to each employee
select e.emp_name, d.dept_name, c.company_name, c.location
from employee e
join department d on e.dept_id = d.dept_id
cross join company c;

--Natural Join:
select e.emp_name, d.dept_name
from employee e
NATURAL JOIN department d;

--Self Join
--Write a query to fetch the child name and their age corresponding to their parent name and parent age
select child.name as child_name, child.age as child_age, parent.name as parent_name,parent.age as parent_age
from family as child
join family as parent on child.parent_id = parent.member_id;

--To return all child(those who have no parents will be included too)
select child.name as child_name, child.age as child_age, parent.name as parent_name,parent.age as parent_age
from family as child
left join family as parent on child.parent_id = parent.member_id;
