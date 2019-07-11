RSpec.describe ApplicationHelper do
  describe '#toastr_key' do
    context 'when notice' do
      subject { toastr_key('notice') }

      it { is_expected.to eq('success') }
    end

    context 'when success' do
      subject { toastr_key('success') }

      it { is_expected.to eq('success') }
    end

    context 'when error' do
      subject { toastr_key('error') }

      it { is_expected.to eq('error') }
    end

    context 'when alert' do
      subject { toastr_key('alert') }

      it { is_expected.to eq('error') }
    end

    context 'when anything' do
      subject { toastr_key('anything') }

      it { is_expected.to eq('warning') }
    end
  end

  describe '#between' do
    let(:start_at) { 2.days.ago }
    let(:end_at) { 1.days.ago }
    subject { between(start_at, end_at) }

    it { is_expected.to eq("#{l(start_at, format: :long)} - #{l(end_at, format: :long)}") }
  end
end
