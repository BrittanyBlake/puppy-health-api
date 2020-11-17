require 'rails_helper'

RSpec.describe 'Treats API', type: :request do
  let(:user) { create(:user) }
  let!(:treats) { create_list(:treat, 4, user_id: user.id) }
  let(:treat_id) { treats.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET //api/v1/treats
  describe 'GET Treats' do
    # make HTTP get request before each example
    before { get '/api/v1/treats', params: {}, headers: headers }

    it 'returns treats' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(4)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET //api/v1/treats/:id
  describe 'GET /treats/:id' do
    before { get "/api/v1/treats/#{treat_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the treat' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(treat_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:treat_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Treat with 'id'=#{treat_id}/)
      end
    end
  end

  # Test suite for POST //api/v1/treats
  describe 'POST /api/v1/treats' do
    # valid payload
    let(:valid_attributes) { { treat_type: 'Peaches', amount: '12', date: 'Fri, 06 Nov 2020' }.to_json }

    context 'when the request is valid' do
      before { post '/api/v1/treats', params: valid_attributes, headers: headers }

      it 'creates a treat' do
        expect(json['treat_type']).to eq('Peaches')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { treat_type: nil, amount: nil, date: nil }.to_json }

      before { post '/api/v1/treats', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Treat type can't be blank, Amount can't be blank, Date can't be blank/)
      end
    end
  end
end
