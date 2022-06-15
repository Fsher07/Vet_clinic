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

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices (id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (treatment_id) REFERENCES treatments (id) ON UPDATE CASCADE ON DELETE RESTRICT,
);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(75),
    name VARCHAR(75),
);

CREATE TABLE histories_treatment(
	id SERIAL PRIMARY KEY,
	treatment_id INT,
	medical_history_id INT,
	FOREIGN KEY (treatment_id) REFERENCES treatments(id),
	FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
);

CREATE INDEX index_medical_history_id ON treatment_histories (medical_history_id);
CREATE INDEX index_patient_id ON medical_histories (patient_id);
CREATE INDEX index_invoice_id ON invoice_items (invoice_id);
CREATE INDEX index_treatment_id ON invoice_items (treatment_id);
CREATE INDEX index_medical_histories_id ON invoices (medical_histories_id);
CREATE INDEX index_treatments_id ON treatment_histories (treatment_id);
CREATE INDEX ON index_histories_treatment (medical_history_id);

