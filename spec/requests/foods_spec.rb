require 'rails_helper'
# rubocop:disable LineLength
RSpec.describe 'Foods API', type: :request do
  let(:user) { create(:user) }
  let!(:foods) { create_list(:food, 3, user_id: user.id) }
  let(:food_id) { foods.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'GET Foods' do
    before { get '/api/v1/foods', params: {}, headers: headers }

    it 'returns foods' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /foods/:id' do
    before { get "/api/v1/foods/#{food_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the food' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(food_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:food_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Food/)
      end
    end
  end

  describe 'POST /api/v1/foods' do
    let(:valid_attributes) do
      { brand: 'Caesar Salad', amount: '10', time: '12:53', date: "Fri, 06 Nov 2020", user_id: user.id }.to_json
    end

    context 'when the request is valid' do
      before { post '/api/v1/foods', params: valid_attributes, headers: headers }

      it 'creates a food' do
        expect(json['brand']).to eq('Caesar Salad')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { brand: nil, amount: nil, time: nil, date: nil }.to_json }
      before { post '/api/v1/foods', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Brand can't be blank, Amount can't be blank, Date can't be blank, Time can't be blank/)
      end
    end
  end

  describe 'PUT /api/v1/foods/:id' do
    let(:valid_attributes) { { brand: 'Cobb Salad', amount: '20', time: '11:53', date: "Sat, 07 Nov 2020" }.to_json }

    context 'when the record exists' do
      before { put "/api/v1/foods/#{food_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/v1/foods/:id' do
    before { delete "/api/v1/foods/#{food_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
# rubocop:enable LineLength
