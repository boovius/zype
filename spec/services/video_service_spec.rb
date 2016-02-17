require 'vcr_helper'

RSpec.describe VideoService, :vcr do
  subject { described_class.get_videos 1 }

  let(:page_token) { 1 }

  describe 'get_videos' do
    it 'gets videos from zype api' do
      expect(subject).to be_a VideosResponse
      expect(subject.data).to be_an Array
      expect(subject.data.first).to be_a Video
      expect(subject.data.first.zype_id).to_not be nil
    end
  end
end
