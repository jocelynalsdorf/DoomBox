class SubscribersController < ApplicationController
before_filter :authenticate_user!
def new

end

def update

#gets the credit card details submitted in the form
    token = params[:stripeToken]

    #create a customer
    customer = Stripe::Customer.create(
      card: token,
      plan: 1234,
      email: current_user.email
    )

    current_user.subscribed = true
    current_user.stripeid = customer.id
    current_user.save


    redirect_to products_path, notice: "You have sucessfully subscribed! Now go visit the DoomBox Launchpage at: http://doombox.launchrock.com"



  end
end
