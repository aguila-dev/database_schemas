// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table Users {
  id uuid [primary key]
  name varchar
  email varchar
  isAdmin boolean
  firebaseId uuid
  createdAt timestamp 
  updatedAt timestamp
}

Table Roles {
  id uuid
  name enum('guest', 'athlete', 'former-athlete', 'coach')
  createdAt timestamp
  updatedAt timestamp
}

Table Waivers {
  id uuid [primary key]
  userId uuid [ref: > Users.id]  // Foreign key to Users
  signedDate timestamp
  waiverPdf blob
  isCurrent boolean  // If this is the most recent waiver signed
  createdAt timestamp
  updatedAt timestamp
}

Table UserRoles {
  id uuid [primary key]
  userId uuid [ref: > Users.id]  // Foreign key to Users
  roleId uuid [ref: > Roles.id]  // Foreign key to Roles
  createdAt timestamp
  updatedAt timestamp
}

Table Contracts {
  id uuid [primary key]
  userId uuid [ref: > Users.id]
  coachId uuid [ref: > Coaches.id]
  serviceId uuid [ref: > Services.id]
  startDate timestamp
  endDate timestamp
  isActive boolean
  discount decimal
  totalMonthlyPay decimal
  grossMonthlyPay decimal
  platformFee decimal
  processingFee decimal
  coachShare decimal
  monthsActive int
  totalContractPay decimal
  createdAt timestamp
  updatedAt timestamp
}

Table Services {
  id uuid [primary key]
  name varchar
  description text
  baseFee decimal
  createdAt timestamp
  updatedAt timestamp
}

Table Payments {
  id uuid [primary key]
  userId uuid [ref: > Users.id]
  contractId uuid [ref: > Contracts.id]
  paymentDate timestamp
  amount decimal
  processingFee decimal
  coachShare decimal
  platformFee decimal
  createdAt timestamp
  updatedAt timestamp
}

Table Coaches {
  id uuid [primary key]
  userId uuid [ref: > Users.id]  // Foreign key to Users table
  isContractor boolean
  createdAt timestamp
  updatedAt timestamp
}

Table ServiceSubscriptions {
  id uuid [primary key]
  userId uuid [ref: > Users.id]
  serviceId uuid [ref: > Services.id]
  contractId uuid [ref: > Contracts.id]  // Optional foreign key
  startDate timestamp
  endDate timestamp
  createdAt timestamp
  updatedAt timestamp
}

Table PlatformFees {
  id uuid [primary key]
  serviceId uuid [ref: > Services.id]
  coachId uuid [ref: > Coaches.id]
  feeAmount decimal
  processingRate decimal
  createdAt timestamp
  updatedAt timestamp
}

Table PremadePlans {
  id UUID [primary key]
  coachId UUID
  name STRING 
  distance ENUM('1mi', '5km', '10km', 'half marathon', 'marathon')
  durationInWeeks INTEGER  
  description TEXT  
  price DECIMAL  
  createdAt DATE
  updatedAt DATE
}

Table PurchasedPlans {
  id UUID [primary key]
  userId UUID  
  premadePlanId UUID 
  purchaseDate DATE  
  isCompleted BOOLEAN  
  createdAt DATE
  updatedAt DATE
}
