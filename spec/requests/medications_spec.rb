require 'rails_helper'

RSpec.describe 'Medication API', type: :request do
  let(:user) { create(:user) }
  let!(:medications) { create_list(:medication, 3, user_id: user.id) }
  let(:medication_id) { medications.first.id }
  let(:headers) { valid_headers }

  describe 'GET Medication' do
    before { get '/api/v1/medications', params: {}, headers: headers }

    it 'returns medication' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /medications/:id' do
    before { get "/api/v1/medications/#{medication_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the medication' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(medication_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:medication_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Medication/)
      end
    end
  end

  describe 'POST /api/v1/medications' do
    let(:valid_attributes) { { name: 'Elm', use: 'Learn', dosage: 'Twice a day', user_id: user.id }.to_json }

    context 'when the request is valid' do
      before { post '/api/v1/medications', params: valid_attributes, headers: headers }

      it 'creates a medication' do
        expect(json['name']).to eq('Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { name: nil, use: nil, dosage: nil }.to_json }
      before { post '/api/v1/medications', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank, Use can't be blank, Dosage can't be blank/)
      end
    end
  end

  describe 'PUT /api/v1/medications/:id' do
    let(:valid_attributes) { { name: 'Elm', use: 'learn', dosage: 'Once a day' }.to_json }

    context 'when the record exists' do
      before { put "/api/v1/medications/#{medication_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/v1/medications/:id' do
    before { delete "/api/v1/medications/#{medication_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
