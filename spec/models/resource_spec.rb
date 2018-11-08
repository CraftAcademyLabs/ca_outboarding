RSpec.describe User, type: :model do
  describe 'Database' do
    describe 'table' do
      it { is_expected.to have_db_column :description }
      it { is_expected.to have_db_column :url }
      it { is_expected.to have_db_column :type }
    end

    describe 'associations' do
      it { is_expected.to belong_to :user}
    end
  end

  describe 'Factory' do
    it 'should be valid' do
      expect(FactoryBot.create(:resource)).to be_valid
    end
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :url }
    it { is_expected.to validate_presence_of :type }
  end
end