-- Users Table
CREATE TABLE Users (
                       id INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incremented primary key
                       name NVARCHAR(100) NOT NULL,
                       email NVARCHAR(100) UNIQUE NOT NULL,  -- Ensuring the email is unique
                       password NVARCHAR(255) NOT NULL,  -- Storing encrypted password
                       created_at DATETIME DEFAULT GETDATE()  -- Default value is the current date/time
);

-- Expenses Table
CREATE TABLE Expenses (
          expense_id INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incremented primary key
          user_id INT NOT NULL FOREIGN KEY REFERENCES Users(user_id),  -- Foreign key to Users table
            [month] NVARCHAR(10) NOT NULL,  -- Month of the expense
            [year] INT NOT NULL,  -- Year of the expense
            category NVARCHAR(100),  -- Category of the expense (e.g., Rent, Utilities, etc.)
            amount DECIMAL(10, 2),  -- Amount of the expense
            payment_method NVARCHAR(100),  -- Payment method (e.g., Credit Card, Cash)
            created_at DATETIME DEFAULT GETDATE()  -- Default value is the current date/time
    );

-- Savings Table
CREATE TABLE Savings (
                         savings_id INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incremented primary key
                         user_id INT NOT NULL FOREIGN KEY REFERENCES Users(user_id),  -- Foreign key to Users table
    [month] NVARCHAR(10) NOT NULL,  -- Month of the savings entry
    [year] INT NOT NULL,  -- Year of the savings entry
    method NVARCHAR(100),  -- Method of savings (e.g., Bank, Splitwise, etc.)
    amount DECIMAL(10, 2),  -- Amount saved
    created_at DATETIME DEFAULT GETDATE()  -- Default value is the current date/time
    );

-- Investments Table
CREATE TABLE Investments (
                             investment_id INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incremented primary key
                             user_id INT NOT NULL FOREIGN KEY REFERENCES Users(user_id),  -- Foreign key to Users table
                             type NVARCHAR(100),  -- Type of investment (e.g., Stocks, Crypto, etc.)
                             amount DECIMAL(10, 2),  -- Amount invested
                             currency NVARCHAR(10) DEFAULT 'INR',  -- Currency of investment, default to INR
                             created_at DATETIME DEFAULT GETDATE()  -- Default value is the current date/time
);

-- Debts Table
CREATE TABLE Debts (
                       debt_id INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incremented primary key
                       user_id INT NOT NULL FOREIGN KEY REFERENCES Users(user_id),  -- Foreign key to Users table
                       creditor NVARCHAR(100),  -- Name of the creditor (e.g., Ritika, Mom)
                       amount DECIMAL(10, 2),  -- Amount of debt
                       currency NVARCHAR(10) DEFAULT 'INR',  -- Currency of debt, default to INR
                       created_at DATETIME DEFAULT GETDATE()  -- Default value is the current date/time
);

-- Deficit Table
CREATE TABLE Deficit (
                         deficit_id INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incremented primary key
                         user_id INT NOT NULL FOREIGN KEY REFERENCES Users(user_id),  -- Foreign key to Users table
    [month] NVARCHAR(10) NOT NULL,  -- Month of the deficit
    [year] INT NOT NULL,  -- Year of the deficit
    deficit_amount DECIMAL(10, 2),  -- Calculated deficit amount
    created_at DATETIME DEFAULT GETDATE()  -- Default value is the current date/time
    );