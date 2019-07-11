RSpec.describe TripsController, type: :request do
  let(:user) { create :user }
  before { sign_in user }

  describe 'GET #index' do
    let(:trips) { create_list :trip, 2, user: user }
    before { get trips_path }

    it { expect(response).to be_successful }
    it { expect(assigns(:trips)).to eq(trips) }
  end

  describe 'GET #new' do
    before { get new_trip_path }

    it { expect(response).to be_successful }
    it { expect(assigns(:trip)).to be_a_new(Trip) }
  end

  describe 'POST #create' do
    context 'valid data' do
      let(:data) { attributes_for(:trip) }

      it 'creates a new trip' do
        expect do
          post trips_path, params: { trip: data }
        end.to change { user.trips.count }.by(1)
      end

      it 'redirects to trip path' do
        post trips_path, params: { trip: data }

        trip = assigns(:trip)
        expect(flash[:success]).to be_present
        expect(response).to redirect_to(trip_path(trip))
      end
    end

    context 'invalid data' do
      let(:data) { { title: '' } }
      before { post trips_path(params: { trip: data }) }

      it { expect(response).to be_successful }
      it { expect(response).to render_template(:new) }
      it { expect(assigns(:trip)).to be_a_new(Trip) }
    end
  end

  describe 'GET #show' do
    let(:trip) { create :trip, user: user }
    before { get trip_path(trip) }

    it { expect(response).to be_successful }
    it { expect(assigns(:trip)).to eq(trip) }

    it 'loads pie_chart_data' do
      expect(Trip::GraphData).to receive(:fetch).with(trip) { {} }

      get trip_path(trip)

      expect(assigns(:pie_chart_data)).to eq({})
    end

    it 'loads activities' do
      activities = create_list :activity, 2, trip: trip

      get trip_path(trip)

      expect(assigns(:activities)).to eq(activities)
    end
  end

  describe 'GET #edit' do
    let(:trip) { create :trip, user: user }
    before { get edit_trip_path(trip) }

    it { expect(response).to be_successful }
    it { expect(assigns(:trip)).to eq(trip) }
  end

  describe 'PATCH|PUT #update' do
    let(:trip) { create :trip, user: user }

    context 'valid data' do
      let(:data) { { title: 'new title' } }

      before { put trip_path(trip), params: { trip: data } }

      it { expect(response).to redirect_to(trip_path(trip)) }
      it { expect(flash[:success]).to be_present }
      it { expect(trip.reload.title).to eq 'new title' }
    end

    context 'invalid data' do
      let(:data) { { title: '' } }

      before { put trip_path(trip), params: { trip: data } }

      it { expect(response).to render_template(:new) }
      it { expect(assigns(:trip).errors).to be_present }
    end
  end

  describe 'DELETE #destroy' do
    let(:trip) { create :trip, user: user }
    before { delete trip_path(trip) }

    it { expect(response).to redirect_to(trips_path) }
    it { expect(flash[:success]).to be_present }
    it { expect(user.trips.count).to eq(0) }
  end
end