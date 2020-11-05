require 'rails_helper'

RSpec.describe 'General Health API', type: :request do
     let!(:general_healths) { create_list(:general_health, 3) }
  let(:general_health_id) { general_healths.first.id }

  describe 'GET General Health' do
    before { get '/api/v1/general_healths' }

    it 'returns general healths' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /general_healths/:id' do
    before { get "/api/v1/general_healths/#{general_health_id}" }

    context 'when the record exists' do
      it 'returns the general_healths' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(general_health_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:general_health_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find GeneralHealth/)
      end
    end
  end

  describe 'POST /api/v1/general_healths' do
    let(:valid_attributes) { { hunger_level: 'normal', energy_level: 'normal', date:'October 21, 2020 20:47'} }

    context 'when the request is valid' do
      before { post '/api/v1/general_healths', params: valid_attributes }

      it 'creates a general_healths' do
        expect(json['hunger_level']).to eq('normal')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/general_healths', params: { energy_level: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Date can't be blank, Hunger level can't be blank/)
      end
    end
  end

  describe 'PUT /api/v1/general_healths/:id' do
    let(:valid_attributes) { { hunger_level: 'high', energy_level: 'low', date:'October 21, 2020 20:47'} }

    context 'when the record exists' do
      before { put "/api/v1/general_healths/#{general_health_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/v1/general_healths/:id' do
    before { delete "/api/v1/general_healths/#{general_health_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end


end
