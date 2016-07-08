require "spec_helper"

describe BooksController, type: :controller do
  describe "GET #index" do
    subject { get :index }
    let(:reader) { User.create(name: "Ponyo", email: "ponyo@example.com", password: "12345678") }
    
    before { login(reader) }

    it "renders the index template" do
      expect(subject).to render_template :index
    end

    it "is successful" do
      expect(response).to be_success
    end
  end

  describe "POST #search" do
    subject { get :search, params }

    context "with valid params" do
      let(:params) {{ query: "Octavia Butler" }}
      it "renders the book index" do
        expect(subject).to render_template :index
      end
    end

    context "with invalid params" do
      let(:params) {{}}

      it "redirects to the book index with a flash message" do 
        expect(subject).to redirect_to books_path
        expect(flash[:notice]).to be_present
      end
    end
  end
end