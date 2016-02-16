require 'vcr_helper'

RSpec.describe VideoService, :vcr do
  subject { described_class.get_videos }

  describe 'get_videos' do
    it 'gets videos from zype api' do
      expect(subject).to be_a VideosResponse
      expect(subject.data).to be_an Array
      expect(subject.first).to be_a Video
    end
  end
end
