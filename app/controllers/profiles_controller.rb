class ProfileController < ApplicationController

  def show
  end

  def edit
    require "stripe"
    Stripe.api_key = "sk_test_PTVRgvgpatfQZVMkHSVlTqLs"

    account = Stripe::Account.retrieve("acct_157VxdKuRisrmOjU")
    account.external_accounts.create(:external_account => "btok_7udS4m3NKxUHgT")
    # Update bank account
    # Updae company name
    # Update First, Last Name
    # Add company logo? -- later

  end

  def update
  end

end
