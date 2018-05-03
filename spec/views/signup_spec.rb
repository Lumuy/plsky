describe 'sign up and login', type: :feature do
  before do
    allow_any_instance_of(Registration::UserController::Base).to receive(:verify_rucaptcha?).and_return(true)
  end

end
