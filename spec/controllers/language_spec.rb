require 'rails_helper'

RSpec.describe LanguagesController do
  describe 'GET new' do
    it 'allowed as admin' do
      admin = create(:user, :admin)
      sign_in admin
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template('new')
    end

    it 'forbidden as member' do
      member = create(:user, :member)
      sign_in member
      expect { get :new }.to raise_error(CanCan::AccessDenied)
    end

    it 'forbidden as unauthorized' do
      member = create(:user, :member)
      sign_in member
      expect { get :new }.to raise_error(CanCan::AccessDenied)
    end
  end

  describe 'POST create' do
    before(:each) do
      admin = create(:user, :admin)
      sign_in admin
    end

    it 'redirect if successful' do
      post :create, params: { language: { name: 'spanish' } }
      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_job_path)
    end

    it 'render if error' do
      post :create, params: { language: { name: '' } }
      expect(response.status).to eq(200)
      expect(response).to render_template('new')
    end
  end
end
