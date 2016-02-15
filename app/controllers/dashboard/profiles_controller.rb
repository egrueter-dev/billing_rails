class Dashboard::ProfilesController < ApplicationController

  def show
  end

  def edit
    # Update bank account You need to retreive an existing account here. If none created,
    # Then create a new external account

    # Move this to Figaro
    Stripe.api_key = "sk_test_PTVRgvgpatfQZVMkHSVlTqLs"

    binding.pry

    account = Stripe::Account.retrieve("acct_157VxdKuRisrmOjU")

    begin

    rescue # external account not found
      account.external_accounts.create(:external_account => "btok_7udS4m3NKxUHgT")
    end

    # Update First, Last Name
    # Add company logo? -- later
  end

  def update

  end
end
