require 'vcr_helper'

RSpec.describe AuthService, :vcr do
  describe 'get_access_token' do
    subject { described_class.get_access_token parameters }

    let(:parameters) {{
      username: 'test@test.com',
      password: 'password'
    }}

    it 'returns an auth response data with access_token' do
      expect(subject).to be_a AuthResponse
      expect(subject.data).to_not be_nil
      expect(subject.data).to be_an Hash
      expect(subject.data[:access_token]).to be_a String
      expect(subject.data[:expires_in]).to be_a Time
    end
  end
end
