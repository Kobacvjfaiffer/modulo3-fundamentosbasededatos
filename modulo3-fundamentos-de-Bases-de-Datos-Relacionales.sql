CREATE TABLE Usuario (
    user_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo_electronico VARCHAR(100),
    contrasena VARCHAR(50),
    saldo DECIMAL(10, 2)
);

CREATE TABLE Moneda (
    currency_id INT PRIMARY KEY,
    currency_name VARCHAR(50),
    currency_symbol VARCHAR(5)
);

CREATE TABLE Transaccion (
    transaction_id INT PRIMARY KEY,
    sender_user_id INT,
    receiver_user_id INT,
    importe DECIMAL(10, 2),
    transaction_date DATE,
    currency_id INT,
    FOREIGN KEY (sender_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (currency_id) REFERENCES Moneda(currency_id)
);

insert into Usuario (user_id,nombre,correo_electronico,contrasena,saldo)
values 
       (1,'carlos','carlos@gmail.com','carlos',123.50),
       (2,'felipe','felipe@gmail.com','felipe',150.40),
       (3,'angel','angel@gmail.com','angel',200.80);
       
      INSERT INTO Moneda (currency_id, currency_name, currency_symbol)
VALUES
    (1, 'Dólar estadounidense', 'USD'),
    (2, 'Euro', 'EUR'),
    (3, 'Libra esterlina', 'GBP'),
    (4, 'Yen japonés', 'JPY'),
    (5, 'Dólar australiano', 'AUD'); 
       
      INSERT INTO Transaccion (transaction_id, sender_user_id, receiver_user_id, importe, transaction_date, currency_id)
VALUES
    (1, 1, 2, 200.00, '2024-03-26', 1),
    (2, 2, 1, 150.00, '2024-03-25', 1),
    (3, 3, 1, 300.00, '2024-03-24', 1);
   
       
SELECT c.currency_name
FROM Usuario u
JOIN Transaccion t ON u.user_id = t.sender_user_id OR u.user_id = t.receiver_user_id
JOIN Moneda c ON t.currency_id = c.currency_id
WHERE u.user_id = 1;

SELECT *
FROM Transaccion;

SELECT *
FROM Transaccion
WHERE sender_user_id = 1 OR receiver_user_id = 2;


UPDATE Usuario
SET correo_electronico = 'nuevo_correo@example.com'
WHERE user_id = 3;


DELETE FROM Transaccion
WHERE transaction_id = 3;


