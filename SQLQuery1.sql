-- ساخت جدول Person
CREATE TABLE Person (
    BusinessEntityID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Suffix NVARCHAR(10) NULL
);

-- ساخت جدول Password
CREATE TABLE Password (
    BusinessEntityID INT PRIMARY KEY,
    PasswordHash NVARCHAR(128),
    ModifiedDate DATE,
    FOREIGN KEY (BusinessEntityID) REFERENCES Person(BusinessEntityID)
);

-- درج داده‌ها در جدول Person
INSERT INTO Person (BusinessEntityID, FirstName, LastName, Suffix)
VALUES 
    (1, N'فرهاد', N'کریمی', N'آقای'),
    (2, N'نازنین', N'رضایی', N'سرکار خانم'),
    (3, N'حسین', N'میرزایی', N'دکتر');

-- درج داده‌ها در جدول Password
INSERT INTO Password (BusinessEntityID, PasswordHash, ModifiedDate)
VALUES 
    (1, N'abc123xyz', '2023-02-10'),
    (2, N'xyz789pqr', '2023-06-22'),
    (3, N'pqr456mno', '2024-01-15');

-- پرس‌وجوی نمونه برای نمایش داده‌ها
SELECT 
    p.FirstName,
    p.LastName,
    pw.PasswordHash
FROM 
    Person p
JOIN 
    Password pw ON p.BusinessEntityID = pw.BusinessEntityID
