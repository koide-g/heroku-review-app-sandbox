require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user smith' do
    let(:user) { create(:user) }

    it "has attributes" do
      expect(user.name).to eq "John Smith"
      expect(user.age).to eq 20
      expect(user.email).to eq "js@example.com"
    end

  end
end
