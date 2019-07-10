require 'rails_helper'

RSpec.describe Trip::GraphData do
  let(:trip) { create :trip }
  subject { Trip::GraphData.fetch(trip) }

  describe '.fetch' do
    before do
      create :activity, trip: trip, category: 'turism', price: 100
      create :activity, trip: trip, category: 'turism', price: 50
      create :activity, trip: trip, category: 'transport', price: 200
      create :activity, trip: trip, category: 'transport', price: 30
      create :activity, trip: trip, category: 'food', price: 50
    end

    it { is_expected.to eq({ 'turism' => 150, 'transport' => 230, 'food' => 50 }) }
  end
end
