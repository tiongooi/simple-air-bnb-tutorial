require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #guest_dashboard" do

  	describe "unauthenticated user" do

  		it "user is redirected to sign in" do
  			get :guest_dashboard
 				# avoid hard-coded urls:
  			#expect(response).to redirect_to("http://test.host/users/sign_in")
  			expect(response).to redirect_to(new_user_session_url)  			
  		end

  	end

  describe "authenticated user" do

    it "returns http success" do
    	user = sign_in_valid_user
		user_booking = Booking.create(:user => user)    	
		user_approved_booking = Booking.create(:user => user, :approved => true)    	

		other_user = User.create(:email => "notme@cf.com")
		Booking.create(:user => other_user)    	
		Booking.create(:user => other_user, :approved => true)    	

		get :guest_dashboard
		expect(response).to have_http_status(:success)

		bookings = assigns(:bookings)
#require 'pry'; binding.pry
		expect(bookings).to match_array([user_booking, user_approved_booking])

		# check pending bookings are correct
		expect(assigns(:pending_bookings)).to match_array([user_booking])

		# check approved bookings are correct
		expect(assigns(:approved_bookings)).to match_array([user_approved_booking])

    end


    def sign_in_valid_user
		user = User.create(:email => "me@cf.com")
		controller.sign_in user
		user
    end

    end
  end

end
