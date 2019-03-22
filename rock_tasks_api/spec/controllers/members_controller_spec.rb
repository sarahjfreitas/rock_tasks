require 'rails_helper'

RSpec.describe MembersController, type: :controller do

  let!(:roles) { create_list(:role, 10) }
  let!(:members) { create_list(:member, 10) }
  let(:valid_attributes) { { name: 'Teste', email: 'teste@email.com', role_id: Role.all.sample.id } }
  let(:invalid_attributes) { {name: 'teste'} } 
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      member = Member.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      member = Member.create! valid_attributes
      get :show, params: {id: member.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Member" do
        expect {
          post :create, params: {member: valid_attributes}, session: valid_session
        }.to change(Member, :count).by(1)
      end

      it "renders a JSON response with the new member" do
        post :create, params: {member: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(member_url(Member.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new member" do

        post :create, params: {member: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested member" do
        member = Member.create! valid_attributes
        put :update, params: {id: member.to_param, member: new_attributes}, session: valid_session
        member.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the member" do
        member = Member.create! valid_attributes

        put :update, params: {id: member.to_param, member: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the member" do
        member = Member.create! valid_attributes

        put :update, params: {id: member.to_param, member: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested member" do
      member = Member.create! valid_attributes
      expect {
        delete :destroy, params: {id: member.to_param}, session: valid_session
      }.to change(Member, :count).by(-1)
    end
  end

end
