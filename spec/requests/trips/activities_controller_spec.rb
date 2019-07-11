RSpec.describe Trips::ActivitiesController, type: :request do
  let(:user) { create :user }
  let(:trip) { create :trip, user: user }
  before { sign_in user }

  describe 'GET #new' do
    before { get new_trip_activity_path(trip_id: trip.id) }

    it { expect(response).to be_successful }
    it { expect(assigns(:trip)).to eq(trip) }
    it { expect(assigns(:activity)).to be_a_new(Activity) }
  end

  describe 'POST #create' do
    context 'valid data' do
      let(:data) { attributes_for(:activity) }

      it 'creates a new activity' do
        expect do
          post trip_activities_path(trip_id: trip.id),
               params: { activity: data }
        end.to change { trip.activities.count }.by(1)
      end

      it 'redirects to trip path' do
        post trip_activities_path(trip_id: trip.id), params: { activity: data }

        trip = assigns(:trip)
        expect(flash[:success]).to be_present
        expect(response).to redirect_to(trip_path(trip))
      end
    end

    context 'invalid data' do
      let(:data) { { description: '' } }
      before do
        post trip_activities_path(trip_id: trip.id), params: { activity: data }
      end

      it { expect(response).to be_successful }
      it { expect(response).to render_template(:new) }
      it { expect(assigns(:trip)).to eq(trip) }
      it { expect(assigns(:activity)).to be_a_new(Activity) }
    end
  end

  describe 'GET #edit' do
    let(:activity) { create :activity, trip_id: trip.id }
    before { get edit_trip_activity_path(trip_id: trip.id, id: activity.id) }

    it { expect(response).to be_successful }
    it { expect(assigns(:trip)).to eq(trip) }
    it { expect(assigns(:activity)).to eq(activity) }
  end

  describe 'PATCH|PUT #update' do
    let(:activity) { create :activity, trip_id: trip.id }

    context 'valid data' do
      let(:data) { { description: 'new description' } }

      before do
        put trip_activity_path(trip_id: trip.id, id: activity.id),
            params: { activity: data }
      end

      it { expect(response).to redirect_to(trip_path(trip)) }
      it { expect(flash[:success]).to be_present }
      it { expect(activity.reload.description).to eq 'new description' }
    end

    context 'invalid data' do
      let(:data) { { description: '' } }

      before do
        put trip_activity_path(trip_id: trip.id, id: activity.id),
            params: { activity: data }
      end

      it { expect(response).to render_template(:new) }
      it { expect(assigns(:activity).errors).to be_present }
    end
  end

  describe 'DELETE #destroy' do
    let(:activity) { create :activity, trip_id: trip.id }
    before { delete trip_activity_path(trip_id: trip.id, id: activity.id) }

    it { expect(response).to redirect_to(trip_path(trip)) }
    it { expect(trip.activities.count).to eq(0) }
  end
end