require "spec_helper"

describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
    it { should have_many(:books) }
  end
end