require 'rails_helper'

RSpec.describe Activity, type: :model do
  it { should belong_to(:trip) }
  it { should validate_presence_of(:description) }

  context 'start at after end at' do
    subject { build(:activity, start_at: 1.day.from_now, end_at: 1.day.ago) }

    before do
      subject.save
    end

    it { expect(subject.errors[:end_at]).to eq(['must be after the start at']) }
  end
end
