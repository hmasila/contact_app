require 'rails_helper'

RSpec.describe "/contacts", type: :request do
  let(:valid_attributes) {
    { name: "John Doe", email: "john.doe@example.com", phone: "1234567890" }
  }

  let(:invalid_attributes) {
    { name: "", email: "", phone: "1234567890" }
  }

  describe "GET /index" do
    before do
      30.times { Contact.create! valid_attributes } # Create 30 contacts for pagination
    end
  
    it "renders a successful response" do
      Contact.create! valid_attributes
      get contacts_url
      expect(response).to be_successful
    end

    it "paginates the contacts" do
      get contacts_url, params: { page: 1 }
      expect(assigns(:contacts).size).to eq(10)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      contact = Contact.create! valid_attributes
      get contact_url(contact)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_contact_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      contact = Contact.create! valid_attributes
      get edit_contact_url(contact)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Contact" do
        expect {
          post contacts_url, params: { contact: valid_attributes }
        }.to change(Contact, :count).by(1)
      end

      it "redirects to the created contact" do
        post contacts_url, params: { contact: valid_attributes }
        expect(response).to redirect_to(contact_url(Contact.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Contact" do
        expect {
          post contacts_url, params: { contact: invalid_attributes }
        }.to change(Contact, :count).by(0)
      end

      it "renders a response with 422 status" do
        post contacts_url, params: { contact: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "Jane Smith", email: "jane.smith@example.com", phone: "0987654321" }
      }

      it "updates the requested contact" do
        contact = Contact.create! valid_attributes
        patch contact_url(contact), params: { contact: new_attributes }
        contact.reload
        expect(contact.name).to eq("Jane Smith")
        expect(contact.email).to eq("jane.smith@example.com")
        expect(contact.phone).to eq("0987654321")
      end

      it "redirects to the contact" do
        contact = Contact.create! valid_attributes
        patch contact_url(contact), params: { contact: new_attributes }
        contact.reload
        expect(response).to redirect_to(contact_url(contact))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status" do
        contact = Contact.create! valid_attributes
        patch contact_url(contact), params: { contact: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested contact" do
      contact = Contact.create! valid_attributes
      expect {
        delete contact_url(contact)
      }.to change(Contact, :count).by(-1)
    end

    it "redirects to the contacts list" do
      contact = Contact.create! valid_attributes
      delete contact_url(contact)
      expect(response).to redirect_to(contacts_url)
    end
  end
end
