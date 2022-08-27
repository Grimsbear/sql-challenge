--List Employee Number, First and Last Name, Sex, and Salary
select e.emp_no, e.first_name, e.last_name, e.sex, s.salary
from employees as e
join salaries as s on (e.emp_no = s.emp_no);

--List First and Last Name of Employees hired in 1986
select hire_date, first_name, last_name
from employees
where hire_date in(
  select hire_date
  from employees
  where hire_date between '1986-01-01' and '1986-12-31'
);

--List the Manager of Each Department with:
--departmant num, department name, manager num, and first and last name

--select * from dept_manager;
--select * from dept_emp;
--select * from employees;

select dm.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
from dept_manager as dm
inner join departments as d on dm.dept_no = d.dept_no
inner join employees as e on dm.emp_no = e.emp_no;

--List the Department of each employee with:
--employee num, first and last name, department name

--select * from employees;
--select * from dept_emp;
--select * from departments;

select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
inner join dept_emp as de on e.emp_no = de.emp_no
inner join departments as d on de.dept_no = d.dept_no;

--List First and Last Names and Sex of Employees Named "Hercules.B"

select first_name, last_name, sex
from employees
where emp_no in (
	select emp_no
	from employees
	where first_name = 'Hercules' and last_name like 'B%'
);

--List Sales Department Employees
--employee num,first and last name, dept_name

select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
inner join dept_emp as de on e.emp_no = de.emp_no
inner join departments as d on de.dept_no = d.dept_no
where d.dept_no in (
	select d.dept_no
	from departments
	where d.dept_name = 'Sales'
); 

--List Sales & Development Employees
--employee num,first and last name, dept_name

select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
inner join dept_emp as de on e.emp_no = de.emp_no
inner join departments as d on de.dept_no = d.dept_no
where d.dept_no in (
	select d.dept_no
	from departments
	where d.dept_name = 'Sales' or d.dept_name = 'Development'
); 

--Unique Counts of Last Names

select count(distinct last_name)
from employees;