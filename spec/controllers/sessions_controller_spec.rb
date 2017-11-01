require 'rails_helper'

describe SessionsController do
  context "GET #new" do
    it "returns http status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create
        expect(response).to have_http_status 302
      end
    end

  end
end
