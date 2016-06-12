require "spec_helper"

describe SessionsController, type: :controller do
  describe "GET #new" do
    subject { get :new }

    it "renders the new template" do 
      expect(subject).to render_template :new
    end
  end

  describe "POST #create" do
    subject { post :create, params }

    context "with authenticated user" do
      # come back to add setup for authentication with capybara and factory girl

      # it "creates a session" do
      #   subject
      #   expect(session[:user_id]).to_not eq nil
      # end

      # it "redirects to the root" do
      #   expect(subject).to redirect_to root_path
      # end
    end

    context "without authenticated user" do
      let(:params) {{}}

      it "does not create a session" do
        subject
        expect(session[:user_id]).to eq nil
      end

      it "renders the new template" do 
        expect(subject).to render_template :new
      end
    end


  end
end