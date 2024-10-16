CREATE TABLE PremadePlans (
  id UUID PRIMARY KEY,
  coachId UUID,
  name VARCHAR,
  distance VARCHAR CHECK (distance IN ('1mi', '5km', '10km', 'half marathon', 'marathon')),
  durationInWeeks INTEGER,
  description TEXT,
  price DECIMAL,
  createdAt DATE,
  updatedAt DATE
);

CREATE TABLE PurchasedPlans (
  id UUID PRIMARY KEY,
  userId UUID,
  premadePlanId UUID,
  purchaseDate DATE,
  isCompleted BOOLEAN,
  createdAt DATE,
  updatedAt DATE
);

CREATE TABLE Services (
  id UUID PRIMARY KEY,
  name VARCHAR,
  description TEXT,
  baseFee DECIMAL,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP
);

CREATE TABLE Payments (
  id UUID PRIMARY KEY,
  userId UUID REFERENCES Users(id),
  contractId UUID REFERENCES Contracts(id),
  paymentDate TIMESTAMP,
  amount DECIMAL,
  processingFee DECIMAL,
  coachShare DECIMAL,
  platformFee DECIMAL,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP
);

CREATE TABLE Coaches (
  id UUID PRIMARY KEY,
  userId UUID REFERENCES Users(id),
  isContractor BOOLEAN,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP
);

CREATE TABLE ServiceSubscriptions (
  id UUID PRIMARY KEY,
  userId UUID REFERENCES Users(id),
  serviceId UUID REFERENCES Services(id),
  contractId UUID REFERENCES Contracts(id),
  startDate TIMESTAMP,
  endDate TIMESTAMP,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP
);

CREATE TABLE PlatformFees (
  id UUID PRIMARY KEY,
  serviceId UUID REFERENCES Services(id),
  coachId UUID REFERENCES Coaches(id),
  feeAmount DECIMAL,
  processingRate DECIMAL,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP
);