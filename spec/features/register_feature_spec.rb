require_relative '../spec_helper.rb'

RSpec.describe 'The register process', type: :feature, js: true do
    describe 'User #register' do
        before :each do
            visit '/users/register'
        end
        it 'loads the register page successfully' do
            expect(page).to have_field('Email')
        end
    end
end
