require 'rails_helper'

RSpec.describe 'General Health API', type: :request do
    let(:user) { create(:user) }
     let!(:general_healths) { create_list(:general_health, 3, user_id: user.id) }
     
     let(:general_health_id) { general_healths.first.id }
     let(:headers) { valid_headers }

  describe 'GET /General Health' do
    before { get '/api/v1/general_healths', params: {}, headers: headers }

    it 'returns general healths' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /general_healths/:id' do
    before { get "/api/v1/general_healths/#{general_health_id}", params: {}, headers: headers }

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
    let(:valid_attributes) { { hunger_level: 'normal', energy_level: 'normal', date:'October 21, 2020 20:47', user_id: user.id}.to_json }

    context 'when the request is valid' do
      before { post '/api/v1/general_healths', params: valid_attributes, headers: headers }

      it 'creates a general_healths' do
        expect(json['hunger_level']).to eq('normal')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes){{ energy_level: nil, hunger_level: nil, date: nil }.to_json}
      before { post '/api/v1/general_healths', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Date can't be blank, Energy level can't be blank, Hunger level can't be blank/)
      end
    end
  end

  describe 'PUT /api/v1/general_healths/:id' do
    let(:valid_attributes) { { hunger_level: 'high', energy_level: 'low', date:'October 21, 2020 20:47'}.to_json }

    context 'when the record exists' do
      before { put "/api/v1/general_healths/#{general_health_id}", params: valid_attributes, headers: headers  }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/v1/general_healths/:id' do
    before { delete "/api/v1/general_healths/#{general_health_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end


end
