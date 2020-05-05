-- Data Engineering --

-- Drop Tables if Existing
-- DROP TABLE IF EXISTS departments;
-- DROP TABLE IF EXISTS dept_emp;
-- DROP TABLE IF EXISTS dept_manager;
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS salaries;
-- DROP TABLE IF EXISTS titles;

-- Exported from QuickDBD : DTs, PKs & FKs 
-- Import CSVs into corresponding SQL tables

CREATE TABLE "employees" (
    "emp_no" INT NOT NULL,
	"emp_title_id" VARCHAR(35) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(35) NOT NULL,
    "last_name" VARCHAR(35) NOT NULL,
    "sex" VARCHAR(1) NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- SELECT employees(emp_title_id) AS title_id;

CREATE TABLE "departments" (
    "dept_no" VARCHAR(35) NOT NULL,
    "dept_name" VARCHAR(35) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(35) NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(35) NOT NULL,
    "emp_no" INT NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(35) NOT NULL PRIMARY KEY,
	"title" VARCHAR(35) NOT NULL
    );

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

-- Query * FROM Each Table Confirming Data
-- SELECT * FROM departments;
-- SELECT * FROM dept_emp;
-- SELECT * FROM dept_manager;
-- SELECT * FROM employees;
-- SELECT * FROM salaries;
-- SELECT * FROM titles;