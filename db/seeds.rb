# We could use faker gem here but since it's a small app, let's just generate some randoms
# Clear existing data
Contact.destroy_all

# Function to generate random names
def random_name
  first_names = ["John", "Jane", "Alex", "Chris", "Pat", "Taylor", "Jordan", "Morgan"]
  last_names = ["Smith", "Doe", "Brown", "Johnson", "Lee", "Walker", "Hall", "Young"]
  "#{first_names.sample} #{last_names.sample}"
end

def random_phone
  Array.new(10) { rand(0..9) }.join
end

def random_email(name)
  domains = ["example.com", "mail.com", "test.org", "email.net"]
  "#{name.downcase.gsub(' ', '.')}@#{domains.sample}"
end

# Create sample contacts
20.times do
  name = random_name
  Contact.create!(
    name: name,
    email: random_email(name),
    phone: random_phone
  )
end

puts "Created 20 contacts"
