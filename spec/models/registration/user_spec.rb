require "rails_helper"

describe Registration::User, type: :model do
  let(:user) { create :user }

  describe "phone number" do
    context "is not 11" do
      let(:user) { build(:user, phone_number: '123456789') }
      it { expect(user.valid?).to eq false }
    end

    context "begin with 0" do
      let(:user) { build(:user, phone_number: '01122223333') }
      it { expect(user.valid?).to eq false}
    end

    context "correct number" do
      let(:user) { build(:user, phone_number: '13866668888') }
      it { expect(user.valid?).to eq true }
    end
  end

  describe "email" do
    context 'missing @' do
      let(:user) { build(:user, email: 'test.test.com') }
      it { expect(user.valid?).to eq false }
    end
    context 'missing dot' do
      let(:user) { build(:user, email: 'test@com') }
      it { expect(user.valid?).to eq false }
    end
    context 'correct format' do
      let(:user) { build(:user, email: 'test@test.com') }
      it { expect(user.valid?).to eq true }
    end
  end

end
