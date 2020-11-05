require 'rails_helper'

RSpec.describe 'Treats API', type: :request do
    # initialize test data
  let!(:treats) { create_list(:treat, 4) }
  let(:treat_id) { treats.first.id }

  # Test suite for GET //api/v1/treats
  describe 'GET Treats' do
    # make HTTP get request before each example
    before { get '/api/v1/treats' }

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
    before { get "/api/v1/treats/#{treat_id}" }

    context 'when the record exists' do
      it 'returns the todo' do
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
    let(:valid_attributes) { { treat_type: 'Peaches', amount: '12', date: "Fri, 06 Nov 2020"} }

    context 'when the request is valid' do
      before { post '/api/v1/treats', params: valid_attributes }

      it 'creates a treat' do
        expect(json['treat_type']).to eq('Peaches')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/treats', params: { treat_type: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Amount can't be blank, Date can't be blank/)
      end
    end
  end

  # Test suite for PUT //api/v1/treats/:id
  describe 'PUT /api/v1/treats/:id' do
    let(:valid_attributes) { { treat_type: 'Apples', amount: '20', date: "Sat, 07 Nov 2020"} }

    context 'when the record exists' do
      before { put "/api/v1/treats/#{treat_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE //api/v1/treats/:id
  describe 'DELETE /api/v1/treats/:id' do
    before { delete "/api/v1/treats/#{treat_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
