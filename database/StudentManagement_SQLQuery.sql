CREATE DATABASE StudentManagement;
USE StudentManagement;
GO

-- Create table: class
CREATE TABLE class (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL   -- class name
);
GO

-- Create table: student, linked with class
CREATE TABLE student (
    id INT PRIMARY KEY IDENTITY(1,1),
    class_id INT,
    student_code NVARCHAR(50) NOT NULL, -- unique student code
    full_name NVARCHAR(255) NOT NULL,
    gender NVARCHAR(10) NOT NULL,
    gpa FLOAT,
    is_active BIT NOT NULL, -- 1: studying, 0: graduated/left
    FOREIGN KEY (class_id) REFERENCES class(id)
);
GO

-- Insert data into class
INSERT INTO class (name) VALUES
(N'Information Technology'),
(N'Business Administration'),
(N'Marketing'),
(N'Accounting'),
(N'English Language');
GO

-- Insert data into student
INSERT INTO student (class_id, student_code, full_name, gender, gpa, is_active) VALUES
(1, N'SV001', N'Nguyen Van A', N'Male', 3.5, 1),
(1, N'SV002', N'Tran Thi B', N'Female', 3.2, 1),
(2, N'SV003', N'Hoang Van C', N'Male', 3.8, 1),
(2, N'SV004', N'Pham Thi D', N'Female', 2.9, 0),
(3, N'SV005', N'Le Van E', N'Male', 3.6, 1),
(3, N'SV006', N'Bui Thi F', N'Female', 3.1, 1),
(4, N'SV007', N'Ngo Van G', N'Male', 2.7, 1),
(4, N'SV008', N'Do Thi H', N'Female', 3.4, 0),
(5, N'SV009', N'Vu Van I', N'Male', 3.3, 1),
(5, N'SV010', N'Nguyen Thi K', N'Female', 3.9, 1);
GO

SELECT * FROM class;
SELECT * FROM student;


