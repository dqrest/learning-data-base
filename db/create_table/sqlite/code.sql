--
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Buyer
CREATE TABLE Buyer (
    ID          INTEGER NOT NULL
                        UNIQUE,
    FIO         TEXT    NOT NULL,
    PhoneNumber INTEGER NOT NULL,
    PRIMARY KEY (
        ID AUTOINCREMENT
    ),
    CONSTRAINT PhoneNumber_range CHECK ("PhoneNumber" > 0) 
);


-- Table: OrderProduct
CREATE TABLE OrderProduct (
    OrderID   INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    PRIMARY KEY (
        ProductID,
        OrderID
    ),
    FOREIGN KEY (
        ProductID
    )
    REFERENCES Product (ID),
    FOREIGN KEY (
        OrderID
    )
    REFERENCES Orderr (ID) 
);


-- Table: Orderr
CREATE TABLE Orderr (
    ID       INTEGER NOT NULL
                     UNIQUE,
    Quantity INTEGER NOT NULL,
    BuyerID  INTEGER NOT NULL,
    Date     TEXT    NOT NULL,
    Status   TEXT    NOT NULL,
    PRIMARY KEY (
        ID AUTOINCREMENT
    ),
    FOREIGN KEY (
        BuyerID
    )
    REFERENCES Buyer (ID) 
);


-- Table: Product
CREATE TABLE Product (
    ID            INTEGER NOT NULL
                          UNIQUE,
    ShopID        INTEGER NOT NULL,
    UnitOfMessure TEXT    NOT NULL,
    Price         REAL    NOT NULL,
    Quantity      INTEGER NOT NULL,
    Availability  BLOB    NOT NULL,
    Date          TEXT    NOT NULL,
    Name          TEXT    NOT NULL,
    PRIMARY KEY (
        ID AUTOINCREMENT
    ),
    FOREIGN KEY (
        ShopID
    )
    REFERENCES Shop (ID) 
);


-- Table: Shop
CREATE TABLE Shop (
    ID       INTEGER NOT NULL
                     UNIQUE,
    Location TEXT    NOT NULL,
    PRIMARY KEY (
        ID AUTOINCREMENT
    )
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
