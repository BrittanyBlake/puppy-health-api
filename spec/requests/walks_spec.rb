require 'rails_helper'

RSpec.describe 'Walks API', type: :request do
    let!(:walks) { create_list(:walk, 2) }
    let(:walk_id) { walks.first.id }

  describe 'GET Walks' do
    before { get '/api/v1/walks' }

    it 'returns walks' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /walks/:id' do
    before { get "/api/v1/walks/#{walk_id}" }

    context 'when the record exists' do
      it 'returns the walk' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(walk_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:walk_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Walk/)
      end
    end
  end

  describe 'POST /api/v1/walks' do
    let(:valid_attributes) { { distance: '10', time:'12:53', date: "Fri, 06 Nov 2020"} }

    context 'when the request is valid' do
      before { post '/api/v1/walks', params: valid_attributes }

      it 'creates a walks' do
        expect(json['distance']).to eq(10)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/walks', params: { distance: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Time can't be blank, Date can't be blank/)
      end
    end
  end

  describe 'PUT /api/v1/walks/:id' do
    let(:valid_attributes) { { distance: '20', time:'11:53', date: "Sat, 07 Nov 2020"} }

    context 'when the record exists' do
      before { put "/api/v1/walks/#{walk_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/v1/walks/:id' do
    before { delete "/api/v1/walks/#{walk_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
