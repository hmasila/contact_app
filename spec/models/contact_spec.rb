require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "is valid with valid attributes" do
    contact = Contact.new(name: "John Doe", email: "john@example.com", phone: "1234567890")
    expect(contact).to be_valid
  end

  it "is not valid without a name" do
    contact = Contact.new(email: "john@example.com", phone: "1234567890")
    expect(contact).to_not be_valid
  end

  it "is not valid without an email" do
    contact = Contact.new(name: "John Doe", phone: "1234567890")
    expect(contact).to_not be_valid
  end
end
