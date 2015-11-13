require 'rails_helper'

describe User do
  let(:user) { create(:user) }

  describe '#has_linked_github?' do
    let!(:authentication) { create(:authentication, user: user) }

    it { expect(user.has_linked_github?).to eq(true) }

    it 'false' do
      authentication.destroy
      expect(user.has_linked_github?).to eq(false)
    end
  end

  describe '#reset_current_block' do
    let(:block) { create(:block, user: user) }
    before { user.update(current_block: block) }
    
    it 'reset' do
      expect{ user.reset_current_block}.to change{user.current_block_id}.from(block.id).to(nil)
    end
  end
end
