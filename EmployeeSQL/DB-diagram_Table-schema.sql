# https://app.quickdatabasediagrams.com/#/d/IVG5iX


# To modify this code in order to update the DB schema diagram, please vist the link above and paste the revised code below:


departments
-
dept_no VARCHAR PK
dept_name VARCHAR

dept_emp
-
emp_no INT FK >- employees.emp_no
dept_no VARCHAR FK >- departments.dept_no

dept_manager
-
dept_no VARCHAR FK >- departments.dept_no
emp_no INT FK >- employees.emp_no

employees
-
emp_no INT PK
emp_title_id INT FK >- titles.title_id
birth_date DATE
first_name VARCHAR
last_name VARCHAR
sex VARCHAR
hire_date DATE

salaries
-
emp_no INT FK >- employees.emp_no
salary INT

titles
-
title_id INT PK
title VARCHAR
