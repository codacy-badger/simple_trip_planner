RSpec.describe Trip, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }

  context 'start at after end at' do
    subject { build(:trip, start_at: 1.day.from_now, end_at: 1.day.ago) }

    before do
      subject.save
    end

    it { expect(subject.errors[:end_at]).to eq(['must be after the start at']) }
  end
end
