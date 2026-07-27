CREATE TABLE IF NOT EXISTS expenses (
    id SERIAL PRIMARY KEY,
    description VARCHAR(100) NOT NULL,
    amount VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL
);

INSERT INTO expenses (description, amount, category)
VALUES
    ('Internet', 300.00, 'Servicios'),
    ('AWS Lab', 50.00, 'Cloud'),
    ('Curso Docker', 150.00, 'Educación'),
    ('Dominio Web', 120.00, 'Infraestructura');
