require 'rails_helper'

RSpec.describe "Sites", type: :request do
  describe "GET /" do
    it "says hello" do
      get root_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("Hello")
    end
  end
end
