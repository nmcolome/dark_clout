require 'rails_helper'

describe "can create meta data from fb photos" do
  scenario "can scan photos successfully" do
    user = create(:user, fb_id: ENV['my_fb_id'], token: ENV['my_fb_token'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/photos'

    DataSlurper.new(user).fb_slurping


  end
end