# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing records (order matters for foreign keys)
TrustRole.destroy_all
Director.destroy_all
Shareholder.destroy_all
Ubo.destroy_all
Document.destroy_all
RiskAssessment.destroy_all
Kyb.destroy_all
Kyc.destroy_all
PepStatus.destroy_all
Voi.destroy_all
Cdd.destroy_all
Buyer.destroy_all
Seller.destroy_all
Transaction.destroy_all
Entity.destroy_all
User.destroy_all
Company.destroy_all

# --- Companies ---
company_1 = Company.create!(name: "Smith & Associates Legal", abn: "12345678901", status: "active")
company_2 = Company.create!(name: "Pacific Property Group", abn: "98765432109", status: "active")

puts "Created #{Company.count} companies"

# --- Users ---
user_1 = User.create!(email: "alice@smithlegal.com.au", role: "admin", company: company_1)
user_2 = User.create!(email: "bob@smithlegal.com.au", role: "user", company: company_1)
user_3 = User.create!(email: "carol@pacificproperty.com.au", role: "admin", company: company_2)

puts "Created #{User.count} users"

# --- Entities ---
individual_1 = Individual.create!(first_name: "James", last_name: "Wilson", name: "James Wilson", status: "active", risk_rating: "low", date_of_birth: Date.new(1985, 3, 15))
individual_2 = Individual.create!(first_name: "Sarah", last_name: "Chen", name: "Sarah Chen", status: "active", risk_rating: "medium", date_of_birth: Date.new(1990, 7, 22))
individual_3 = Individual.create!(first_name: "Michael", last_name: "O'Brien", name: "Michael O'Brien", status: "active", risk_rating: "low", date_of_birth: Date.new(1978, 11, 8))
individual_4 = Individual.create!(first_name: "Lisa", last_name: "Nguyen", name: "Lisa Nguyen", status: "pending", risk_rating: "high", date_of_birth: Date.new(1992, 1, 30))

business_1 = Business.create!(name: "Oceanic Imports Pty Ltd", abn: "11223344556", registration_number: "ACN111222333", status: "active", risk_rating: "medium")
business_2 = Business.create!(name: "GreenTech Solutions", abn: "66554433221", registration_number: "ACN444555666", status: "active", risk_rating: "low")

trust_1 = Trust.create!(name: "Wilson Family Trust", trust_type: "discretionary", status: "active", risk_rating: "low")

partnership_1 = Partnership.create!(name: "Chen & O'Brien Partners", status: "active", risk_rating: "medium")

puts "Created #{Entity.count} entities (#{Individual.count} individuals, #{Business.count} businesses, #{Trust.count} trusts, #{Partnership.count} partnerships)"

# --- Compliance: CDD ---
Cdd.create!(entity: individual_1)
Cdd.create!(entity: individual_2)
Cdd.create!(entity: business_1)
Cdd.create!(entity: trust_1)

puts "Created #{Cdd.count} CDD records"

# --- Compliance: VOI (Individual only) ---
Voi.create!(entity: individual_1)
Voi.create!(entity: individual_2)
Voi.create!(entity: individual_3)

puts "Created #{Voi.count} VOI records"

# --- Compliance: PEP Status (Individual only) ---
PepStatus.create!(entity: individual_1)
PepStatus.create!(entity: individual_4)

puts "Created #{PepStatus.count} PEP status records"

# --- Compliance: KYC (Individual only) ---
Kyc.create!(entity: individual_1)
Kyc.create!(entity: individual_2)

puts "Created #{Kyc.count} KYC records"

# --- Compliance: KYB (Business only) ---
Kyb.create!(entity: business_1)
Kyb.create!(entity: business_2)

puts "Created #{Kyb.count} KYB records"

# --- Risk Assessments ---
RiskAssessment.create!(entity: individual_1)
RiskAssessment.create!(entity: business_1)
RiskAssessment.create!(entity: trust_1)

puts "Created #{RiskAssessment.count} risk assessments"

# --- Documents ---
Document.create!(entity: individual_1)
Document.create!(entity: individual_2)
Document.create!(entity: business_1)

puts "Created #{Document.count} documents"

# --- UBO (Business only) ---
ubo_1 = Ubo.create!(entity: business_1)
ubo_2 = Ubo.create!(entity: business_2)

puts "Created #{Ubo.count} UBOs"

# --- Shareholders ---
Shareholder.create!(ubo: ubo_1, shareholdable: individual_1, percentage: 60.0)
Shareholder.create!(ubo: ubo_1, shareholdable: individual_2, percentage: 40.0)
Shareholder.create!(ubo: ubo_2, shareholdable: business_1, percentage: 100.0)

puts "Created #{Shareholder.count} shareholders"

# --- Directors ---
Director.create!(ubo: ubo_1, individual: individual_1)
Director.create!(ubo: ubo_1, individual: individual_3)
Director.create!(ubo: ubo_2, individual: individual_2)

puts "Created #{Director.count} directors"

# --- Trust Roles ---
TrustRole.create!(trust: trust_1, individual: individual_1, role: "settlor")
TrustRole.create!(trust: trust_1, individual: individual_3, role: "trustee")
TrustRole.create!(trust: trust_1, individual: individual_2, role: "beneficiary")

puts "Created #{TrustRole.count} trust roles"

# --- Transactions ---
# Standard transactions
StandardTransaction.create!(user: user_1, status: "completed", partyable: individual_1)
StandardTransaction.create!(user: user_2, status: "pending", partyable: business_1)
StandardTransaction.create!(user: user_1, status: "completed", partyable: individual_2)

# Property transactions
pt_1 = PropertyTransaction.create!(user: user_3, status: "in_progress", property_address: "42 Harbour St, Sydney NSW 2000")
pt_2 = PropertyTransaction.create!(user: user_1, status: "completed", property_address: "15 Collins St, Melbourne VIC 3000")

Seller.create!(property_transaction: pt_1, partyable: individual_1)
Buyer.create!(property_transaction: pt_1, partyable: business_1)
Buyer.create!(property_transaction: pt_1, partyable: individual_4)

Seller.create!(property_transaction: pt_2, partyable: trust_1)
Buyer.create!(property_transaction: pt_2, partyable: individual_3)

puts "Created #{Transaction.count} transactions (#{StandardTransaction.count} standard, #{PropertyTransaction.count} property)"
puts "Created #{Seller.count} sellers, #{Buyer.count} buyers"

puts "\nSeed complete!"
