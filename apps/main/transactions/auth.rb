require "main/transactions"

Main::Transactions.define do |t|
  t.define "main.transactions.auth.sign_up" do
    step :create_authentication, with: "main.operations.authentications.create"
  end
end
