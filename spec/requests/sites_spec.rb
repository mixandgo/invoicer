require 'rails_helper'

RSpec.describe "Sites", type: :request do
  describe "GET /" do
    it "redirects to the login page" do
      get root_path
      expect(response).to have_http_status(302)
    end
  end
end
