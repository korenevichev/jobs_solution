require 'rails_helper'

RSpec.describe JobsController do
  it 'GET index' do
    job = create(:job)
    get :index
    expect(response.status).to eq(200)
    expect(response).to render_template('index')
    expect(assigns(:jobs)).to eq([job])
  end

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
    it 'redirect if successful' do
      language = create(:language)
      shift = create(:shift)
      post :create, params:
        { job:
            { title: 'any',
              salary_per_hour: 5,
              languages: [language.id],
              shifts: [shift.id]
            }
        }
      expect(response.status).to eq(302)
      expect(response).to redirect_to(jobs_path)
    end

    it 'render if error' do
      post :create, params: { job: { title: 'any', salary_per_hour: 5, languages: [], shifts: [] } }
      expect(response.status).to eq(200)
      expect(response).to render_template('new')
    end
  end

  describe 'POST apply' do
    it 'allowed as member' do
      job = create(:job)
      member = create(:user, :member)
      sign_in member
      post :apply, params: { job_id: job.id }
      expect(response.status).to eq(204)
    end

    it 'forbidden as unauthorized' do
      job = create(:job)
      expect { post :apply, params: { job_id: job.id } }.to raise_error(CanCan::AccessDenied)
    end
  end
end
