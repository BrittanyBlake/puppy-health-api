require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  # initialize test data
  let!(:foods) { create_list(:food, 3) }
  let(:food_id) { todos.first.id }

  # Test suite for GET /todos
  describe 'GET /foods' do
    # make HTTP get request before each example
    before { get '/foods' }

    it 'returns foods' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe 'GET /foods/:id' do
    before { get "/foods/#{food_id}" }

    context 'when the record exists' do
      it 'returns the todo' do
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

  # Test suite for POST /todos
  describe 'POST /foods' do
    # valid payload
    let(:valid_attributes) { { brand: 'Caesar Salad', amount: '10', time:'12:53', date: "Fri, 06 Nov 2020"} }

    context 'when the request is valid' do
      before { post '/foods', params: valid_attributes }

      it 'creates a food' do
        expect(json['brand']).to eq('Caesar Salad')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/food', params: { brand: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /todos/:id
  describe 'PUT /foods/:id' do
    let(:valid_attributes) { { brand: 'Cobb Salad', amount: '20', time:'11:53', date: "Sat, 07 Nov 2020"} }

    context 'when the record exists' do
      before { put "/foods/#{food_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /foods/:id' do
    before { delete "/foods/#{food_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end