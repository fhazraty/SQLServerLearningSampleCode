-- ساخت جدول Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

-- درج داده‌ها در جدول Employees
INSERT INTO Employees (EmployeeID, Name, Department, Salary, HireDate)
VALUES 
    (1, N'علی حسینی', N'فناوری اطلاعات', 75000.00, '2023-05-15'),
    (2, N'مریم احمدی', N'منابع انسانی', 65000.50, '2022-11-01'),
    (3, N'رضا محمدی', N'مالی', 80000.75, '2024-01-10');

-- تغییر نام ستون HireDate به DateOfHire
EXEC sp_rename 'Employees.HireDate', 'DateOfHire', 'COLUMN';

-- نمایش داده‌ها برای بررسی
SELECT * FROM Employees;


-- اضافه کردن دو ستون جدید FirstName و LastName
ALTER TABLE Employees
ADD FirstName NVARCHAR(25),
    LastName NVARCHAR(25);

-- جداسازی ستون Name به FirstName و LastName بر اساس Space
UPDATE Employees
SET 
    FirstName = LEFT(Name, CHARINDEX(' ', Name) - 1),
    LastName = SUBSTRING(Name, CHARINDEX(' ', Name) + 1, LEN(Name))
WHERE 
    CHARINDEX(' ', Name) > 0;

-- (اختیاری) حذف ستون Name پس از انتقال داده‌ها
ALTER TABLE Employees
DROP COLUMN Name;

-- نمایش داده‌ها برای بررسی
SELECT * FROM Employees;