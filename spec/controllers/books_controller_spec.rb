require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe "GET show" do

    let(:book) { FactoryGirl.create(:book) }

    it "returns http success" do
      get :show, id: book
      expect(response).to have_http_status(:success)
    end

    it "gets a book" do
      get :show, id: book
      expect(assigns(:book)).to_not be_nil
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do

    let(:book) { FactoryGirl.attributes_for(:book) }

    it "creates a new book" do
      expect { post :create, book: book }.to change(Book, :count).by(1)
    end

    it "redirects to show template on success" do
      post :create, book: book
      expect(response).to redirect_to book_url(Book.last.id)
    end

    it "renders the new template on failure" do
      post :create, book: nil
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe "GET edit" do

    let(:book) { FactoryGirl.create(:book) }

    it "returns http success" do
      get :edit, id: book
      expect(response).to have_http_status(:success)
    end

    it "renders the book data" do
      get :edit, id: book
      expect(assigns(:book)).to_not be_nil
    end
  end

  describe "PUT update" do

    let(:book) { FactoryGirl.create(:book) }
    let(:attr) { { :title => "Scorpian" } }

    it "updates a book" do
      put :update, :id => book, :book => attr
      book.reload
      expect(book.title).to eql(attr[:title])
    end

    it "redirects to the show on success" do
      put :update, :id => book, :book => attr
      expect(response).to redirect_to(book_url(book.id))
    end

    it "renders the edit on failure" do
      put :update, :id => book, :book => nil
      expect(response).to have_http_status(:bad_request)
    end
  end


  describe "DELETE destroy" do

    context "when the book record exists" do
      let!(:book) { FactoryGirl.create(:book) }

      it "removes a book" do
        expect { delete :destroy, id: book }.to change(Book, :count)
      end

      it "redirects to the show on success" do
        delete :destroy, id: book
        expect(response).to redirect_to(action: :show)
      end
    end

    context "when the book record does not exist" do

      it "is not successful" do
        expect { delete :destroy, id: 1 }.to_not change(Book, :count)
      end

      it "renders edit" do
        delete :destroy, id: 1
        expect(response).to render_template(:edit)
      end
    end
  end


end
