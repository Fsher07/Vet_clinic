CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(75),
    date_of_birth date,
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total amount DECIMAL,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at timestamp,
    patient_id INT,
    status VARCHAR(75),
    FOREIGN KEY (patient_id) REFERENCES patients (id) ON UPDATE CASCADE ON DELETE RESTRICT
);