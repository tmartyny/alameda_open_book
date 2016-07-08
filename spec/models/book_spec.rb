require "spec_helper"

describe Book, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :author }
    it { should validate_uniqueness_of(:title).scoped_to(:author) }
    it { should belong_to(:user) }
  end
end