require "spec_helper"

describe UsersController, type: :controller do
  describe "GET #new" do
    subject { get :new }

    it "renders the new template" do 
      expect(subject).to render_template :new
    end
  end

  describe "POST #create" do
    subject { post :create, user: params }

    context "with valid params" do
      let(:params) {{
        name: "Ashitaka", 
        email: "Ashitaka@example.com", 
        password: "Nago is coming", 
        password_confirmation: "Nago is coming"
      }}
      
      it "creates an account" do
        expect{ subject }.to change{ User.count }.by 1
      end

      it "redirects to the correct view" do
        expect(subject).to redirect_to root_path
      end
    end

    context "with invalid params" do
      let(:params) {{}}
      
      it "does not create an account" do
        expect{ subject }.to_not change{ User.count }
      end

      it "renders the new template" do 
        expect(subject).to render_template :new
      end
    end
  end
end