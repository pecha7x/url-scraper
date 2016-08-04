require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #create' do
    let!(:url) { 'http://stackoverflow.com/' }
    let(:response_data) { JSON.parse(response.body)['data'] }

    before {
      process :create, method: :post, params: { page: {url: url} }
    }

    it 'responds with 201' do
      expect(response.status).to be 201
    end

    it 'does return correct data' do
      expect(response_data['type']).to eq 'pages'
      expect(response_data['attributes']['url']).to eq url
      expect(response_data['attributes']['tags'].size).to_not be 0
      expect(response_data['attributes']['tags'][0]['value']).to_not be_nil
    end
  end

  describe 'GET #show' do
    let!(:page) { FactoryGirl.create(:page) }

    let(:response_data) { JSON.parse(response.body)['data'] }

    it 'responds with 200' do
      process :show, method: :get, params: { id: page.id }

      expect(response.status).to be 200
    end

    it 'does return correct data by ID' do
      process :show, method: :get, params: { id: page.id }

      expect(response_data['type']).to eq 'pages'
      expect(response_data['attributes']['url']).to eq page.url
      expect(response_data['attributes']['tags'].size).to_not be 0
      expect(response_data['attributes']['tags'][0]['value']).to_not be_nil
    end

    it 'does return correct data by URL' do
      process :show, method: :get, params: { url: page.url }

      expect(response_data['type']).to eq 'pages'
      expect(response_data['attributes']['url']).to eq page.url
      expect(response_data['attributes']['tags'].size).to_not be 0
      expect(response_data['attributes']['tags'][0]['value']).to_not be_nil
    end
  end
end
