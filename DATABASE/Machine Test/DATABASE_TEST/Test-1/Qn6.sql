

-- Table: vehicle
CREATE TABLE vehicle (
  vehicle_regn_number VARCHAR(20) PRIMARY KEY,
  registration_date DATE NOT NULL,
  value DECIMAL NOT NULL
);

-- Table: driver
CREATE TABLE driver (
  driver_number VARCHAR(20) PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL
);

-- Table: insurance_policy
CREATE TABLE insurance_policy (
  policy_number VARCHAR(20) PRIMARY KEY,
  vehicle_regn_number VARCHAR(20) REFERENCES vehicle(vehicle_regn_number),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  driver_number VARCHAR(20) REFERENCES driver(driver_number)
);

-- Table: claim
CREATE TABLE claim (
  claim_number VARCHAR(20) PRIMARY KEY,
  policy_number VARCHAR(20) REFERENCES insurance_policy(policy_number),
  driver_number VARCHAR(20) REFERENCES driver(driver_number),
  claim_amount DECIMAL NOT NULL
);
