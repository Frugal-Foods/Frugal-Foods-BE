require 'rails_helper'
RSpec.describe UserStore, type: :model do
  describe 'relationships' do
    it { should belong_to(:store) }
    it { should belong_to(:user) }
  end
end