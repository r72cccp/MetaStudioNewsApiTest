# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with validations' do
    subject { create :user }

    it { is_expected.to have_secure_password }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  context 'when create new user' do
    let(:user) { create(:user) }

    it 'user must have email' do
      expect(user.email).not_to be_nil
    end

    it 'user must have password_digest' do
      expect(user.password_digest).not_to be_nil
    end

    it 'user must have name' do
      expect(user.name).to a_string_matching(/[a-z\s\-\.]{2,}/i)
    end
  end
end
