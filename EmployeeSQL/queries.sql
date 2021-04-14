--list employee details
SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no

--list all employees hired in 1986 (first_name, last_name, hire_date )
SELECT * FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;

--list manager of each department
SELECT dept_manager.dept_no, 
departments.dept_name,
dept_manager.emp_no,
employees.last_name, 
employees.first_name,
dept_manager.from_date,
dept_manager.to_date
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no
ORDER BY emp_no

--list the department of each employee
SELECT departments.dept_no, deparments.dept_name, employees.emp_no, 
		employees.last_name, employees.first_name, employees.hire_date, dept_manager.to_date
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no
ORDER BY emp_no

--list employee whose firstname is "Hercules" last names begin with "B"

SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

--list all employees in the sales department 
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dept ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_no = 'd007'
AND dept_emp.to_date = '9999-01-01'
	
-- Only employees currently in the sales department
ORDER BY employees.last_name ASC, employees.first_name ASC;

--list all employess in the Sales and Development departments
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments ON dept.dept_no = dept_emp.dept_no
WHERE dept.dept_no IN ('d007', 'd005')
	AND dept_emp.to_date = '9999-01-01' 
-- Only employees currently in these departments
ORDER BY departments.dept_name ASC, employees.last_name ASC, employees.first_name ASC;

--list frequency count in descending order

SELECT last_name, COUNT(first_name) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;