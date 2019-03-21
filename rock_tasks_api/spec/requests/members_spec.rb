require 'rails_helper'

RSpec.describe "Members", type: :request do
  # initialize test data 
  let!(:roles) { create_list(:role, 10) }
  let!(:members) { create_list(:member, 10) }
  let(:member_id) { members.first.id }

  # Test suite for GET /members
  describe 'GET /members' do
    # make HTTP get request before each example
    before { get '/members' }

    it 'returns members' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  # Test suite for GET /members/:id
  describe 'GET /members/:id' do
    before { get "/members/#{member_id}" }

    context 'when the record exists' do
      it 'returns the member' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(member_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:member_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Member/)
      end
    end
  end


  # Test suite for POST /member
  describe 'POST /member' do
    # valid
    let(:valid_attributes) { {member: { name: 'Teste', email: 'teste@email.com' } }}

    context 'when the request is valid' do
      before { post '/todos', params: valid_attributes }

      it 'create member check name' do
        expect(json['name']).to eq('Nome')
      end

      it 'create member check email' do
        expect(json['email']).to eq('email@email.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the name is blank' do
      before { post '/todos', params: { member: {email: 'email@email.com'} } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end

    end

    context 'when the email is blank' do
      before { post '/todos', params: { member: {name: 'Nome'} } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        expect(response.body)
          .to match(/Validation failed: Email can't be blank/)
      end

    end
  end


  #Test suite for PUT /members/:id
  describe 'PUT /members/:id' do
    let(:valid_attributes) { {member:{ name: 'Maria', email: 'maria@maria.com' }} }

    context 'when the record exists' do
      before { put "/members/#{member_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'update member check name' do
        expect(json['name']).to eq('Maria')
      end

      it 'update member check email' do
        expect(json['email']).to eq('maria@maria.com')
      end

    end
  end

  # Test suite for DELETE /members/:id
  describe 'DELETE /members/:id' do
    before { delete "/members/#{member_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end


end
