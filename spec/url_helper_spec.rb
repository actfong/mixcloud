require 'spec_helper'

describe 'Mixcloud::UrlHelper' do
  before do
    FakeWeb.register_uri(:get, 'http://api.mixcloud.com/spartacus/?metadata=1',
                         :body => 'spec/json_responses/user_response.json',
                         :content_type => 'application/json')
    @user = Mixcloud::User.new('http://api.mixcloud.com/spartacus/')
  end

  describe '.validate_mixcloud_url' do
    it 'raises an exception when a user provides an invalid URL to construct an object' do
      # #validate_mixcloud_url is called once a subclass of Resource is instantiated
      expect {
        Mixcloud::User.new('http://www.google.com')
      }.to raise_error (Mixcloud::Error)
    end

    it 'does not do anything if the url is valid' do
      @user.name.should eq 'Spartacus'
    end
  end

  describe '.concat_with_metadata' do
    subject { @user.concat_with_metadata(url) }
    # Since Mixcloud::Resource includes the UrlHelper, its subclasses gets its methods as instance methods
    context 'url already ends with ?metadata=1' do
      let(:url) { 'http://api.mixcloud.com/ctafong/?metadata=1' }
      it { is_expected.to eq url }
    end

    context 'url does not end with a forward slash' do
      let(:url) { 'http://api.mixcloud.com/ctafong' }
      it { is_expected.to eq 'http://api.mixcloud.com/ctafong/?metadata=1' }
    end

    context 'url does not end with ?metadata=1' do
      let(:url) { 'http://api.mixcloud.com/ctafong/' }
      it { is_expected.to eq 'http://api.mixcloud.com/ctafong/?metadata=1' }
    end
  end

  describe '.turn_www_to_api' do
    subject { Mixcloud::Search.turn_www_to_api(url) }
    # since Mixcloud::Search extends the UrlHelper module, we can use its methods as class methods
    context 'host begins with www' do
      let(:url) { 'http://www.mixcloud.com/' }
      it 'substitutes www for api' do
        expect(subject).to eq 'http://api.mixcloud.com/'
      end
    end
    context 'urls has whitespaces' do
      let(:url) { '  http://www.mixcloud.com/   ' }
      it 'strips off whitespaces when necessary' do
        expect(subject).to eq 'http://api.mixcloud.com/'
      end
    end
  end
end
