# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing records
Transaction.destroy_all
LeadEntity.destroy_all
Kyc.destroy_all
Voi.destroy_all
Kyb.destroy_all
NaturalPerson.destroy_all
Company.destroy_all

# Create Natural Persons with KYC and VOI
natural_person_1 = NaturalPerson.create!(
  first_name: "John",
  last_name: "Doe",
  dob: Date.new(1985, 6, 15),
  docs_s3_folder: "s3://docs/natural-persons/john-doe"
)
Kyc.create!(natural_person: natural_person_1)
Voi.create!(natural_person: natural_person_1)

natural_person_2 = NaturalPerson.create!(
  first_name: "Jane",
  last_name: "Smith",
  dob: Date.new(1990, 3, 22),
  docs_s3_folder: "s3://docs/natural-persons/jane-smith"
)
Kyc.create!(natural_person: natural_person_2)
Voi.create!(natural_person: natural_person_2)

natural_person_3 = NaturalPerson.create!(
  first_name: "Michael",
  last_name: "Johnson",
  dob: Date.new(1978, 11, 8),
  docs_s3_folder: "s3://docs/natural-persons/michael-johnson"
)
Kyc.create!(natural_person: natural_person_3)
Voi.create!(natural_person: natural_person_3)

puts "Created #{NaturalPerson.count} natural persons with KYC and VOI records"

# Create Companies with KYB
company_1 = Company.create!(
  name: "Tech Innovations Inc",
  company_number: "ACN123456789",
  docs_s3_folder: "s3://docs/companies/tech-innovations"
)
Kyb.create!(company: company_1)

company_2 = Company.create!(
  name: "Global Trading Ltd",
  company_number: "ACN987654321",
  docs_s3_folder: "s3://docs/companies/global-trading"
)
Kyb.create!(company: company_2)

puts "Created #{Company.count} companies with KYB records"

# Create Lead Entities with polymorphic associations
lead_entity_1 = LeadEntity.create!(
  entity: natural_person_1,
  lead_entity_kind: "naturalPerson",
  status: "complete"
)

lead_entity_2 = LeadEntity.create!(
  entity: company_1,
  lead_entity_kind: "Company",
  status: "in-progress"
)

lead_entity_3 = LeadEntity.create!(
  entity: natural_person_2,
  lead_entity_kind: "naturalPerson",
  status: "started"
)

lead_entity_4 = LeadEntity.create!(
  entity: company_2,
  lead_entity_kind: "Company",
  status: "complete"
)

lead_entity_5 = LeadEntity.create!(
  entity: natural_person_3,
  lead_entity_kind: "naturalPerson",
  status: "abandoned"
)

puts "Created #{LeadEntity.count} lead entities"

# Seed 10 transactions
transactions = [
  {
    transaction_date: DateTime.new(2026, 1, 15, 10, 30, 0),
    status: "completed",
    price: 150.00,
    charge_status: "paid",
    lead_entity: lead_entity_1
  },
  {
    transaction_date: DateTime.new(2026, 1, 16, 14, 45, 0),
    status: "pending",
    price: 275.50,
    charge_status: "pending",
    lead_entity: lead_entity_2
  },
  {
    transaction_date: DateTime.new(2026, 1, 17, 9, 0, 0),
    status: "completed",
    price: 89.99,
    charge_status: "paid",
    lead_entity: lead_entity_1
  },
  {
    transaction_date: DateTime.new(2026, 1, 18, 16, 20, 0),
    status: "failed",
    price: 450.00,
    charge_status: "declined",
    lead_entity: lead_entity_3
  },
  {
    transaction_date: DateTime.new(2026, 1, 19, 11, 15, 0),
    status: "completed",
    price: 32.50,
    charge_status: "paid",
    lead_entity: lead_entity_4
  },
  {
    transaction_date: DateTime.new(2026, 1, 20, 8, 30, 0),
    status: "pending",
    price: 199.99,
    charge_status: "pending",
    lead_entity: lead_entity_2
  },
  {
    transaction_date: DateTime.new(2026, 1, 20, 13, 45, 0),
    status: "completed",
    price: 75.00,
    charge_status: "paid",
    lead_entity: lead_entity_5
  },
  {
    transaction_date: DateTime.new(2026, 1, 21, 10, 0, 0),
    status: "refunded",
    price: 125.00,
    charge_status: "refunded",
    lead_entity: lead_entity_3
  },
  {
    transaction_date: DateTime.new(2026, 1, 21, 15, 30, 0),
    status: "completed",
    price: 599.99,
    charge_status: "paid",
    lead_entity: lead_entity_4
  },
  {
    transaction_date: DateTime.new(2026, 1, 22, 9, 15, 0),
    status: "pending",
    price: 45.00,
    charge_status: "pending",
    lead_entity: lead_entity_1
  }
]

transactions.each do |transaction_data|
  Transaction.create!(transaction_data)
end

puts "Created #{Transaction.count} transactions"
