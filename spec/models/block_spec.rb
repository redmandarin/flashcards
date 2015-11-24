require 'rails_helper'

describe Block do
  describe '#current?' do
    let!(:user) { create(:user) }
    let!(:block) { create(:block, user: user) }

    it 'true' do
      user.update_attribute(:current_block_id, block.id)
      expect(block.current?).to eq(true)
    end

    it 'false' do
      expect(block.current?).to eq(false)
    end
  end
end
