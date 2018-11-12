RSpec.describe Resource, type: :model do
  describe 'Database' do
    describe 'table' do
      it { is_expected.to have_db_column :description }
      it { is_expected.to have_db_column :url }
      it { is_expected.to have_db_column :of_type }
    end

    describe 'associations' do
      it { is_expected.to belong_to :user}
    end
  end

  describe 'Factory' do
    it 'for :repo is valid' do
      expect(create(:repo)).to be_valid
    end

    it 'for :website is valid' do
      expect(create(:website)).to be_valid
    end
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :url }
    it { is_expected.to validate_presence_of :of_type }
  end
end