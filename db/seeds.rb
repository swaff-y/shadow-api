# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing records
Transaction.destroy_all
LeadEntity.destroy_all

# Create Lead Entities
lead_entities = [
  { entity_type: "naturalPerson", status: "complete" },
  { entity_type: "Company", status: "in-progress" },
  { entity_type: "Trust", status: "started" },
  { entity_type: "Partnership", status: "complete" },
  { entity_type: "naturalPerson", status: "abandoned" }
]

created_lead_entities = lead_entities.map do |lead_entity_data|
  LeadEntity.create!(lead_entity_data)
end

puts "Created #{LeadEntity.count} lead entities"

# Seed 10 transactions
transactions = [
  {
    transaction_date: DateTime.new(2026, 1, 15, 10, 30, 0),
    status: "completed",
    price: 150.00,
    charge_status: "paid",
    lead_entity: created_lead_entities[0]
  },
  {
    transaction_date: DateTime.new(2026, 1, 16, 14, 45, 0),
    status: "pending",
    price: 275.50,
    charge_status: "pending",
    lead_entity: created_lead_entities[1]
  },
  {
    transaction_date: DateTime.new(2026, 1, 17, 9, 0, 0),
    status: "completed",
    price: 89.99,
    charge_status: "paid",
    lead_entity: created_lead_entities[0]
  },
  {
    transaction_date: DateTime.new(2026, 1, 18, 16, 20, 0),
    status: "failed",
    price: 450.00,
    charge_status: "declined",
    lead_entity: created_lead_entities[2]
  },
  {
    transaction_date: DateTime.new(2026, 1, 19, 11, 15, 0),
    status: "completed",
    price: 32.50,
    charge_status: "paid",
    lead_entity: created_lead_entities[3]
  },
  {
    transaction_date: DateTime.new(2026, 1, 20, 8, 30, 0),
    status: "pending",
    price: 199.99,
    charge_status: "pending",
    lead_entity: created_lead_entities[1]
  },
  {
    transaction_date: DateTime.new(2026, 1, 20, 13, 45, 0),
    status: "completed",
    price: 75.00,
    charge_status: "paid",
    lead_entity: created_lead_entities[4]
  },
  {
    transaction_date: DateTime.new(2026, 1, 21, 10, 0, 0),
    status: "refunded",
    price: 125.00,
    charge_status: "refunded",
    lead_entity: created_lead_entities[2]
  },
  {
    transaction_date: DateTime.new(2026, 1, 21, 15, 30, 0),
    status: "completed",
    price: 599.99,
    charge_status: "paid",
    lead_entity: created_lead_entities[3]
  },
  {
    transaction_date: DateTime.new(2026, 1, 22, 9, 15, 0),
    status: "pending",
    price: 45.00,
    charge_status: "pending",
    lead_entity: created_lead_entities[0]
  }
]

transactions.each do |transaction_data|
  Transaction.create!(transaction_data)
end

puts "Created #{Transaction.count} transactions"
