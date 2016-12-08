module Main
  class Application
    route "auth" do |r|
      r.on "todoist" do
        r.get "callback" do
          r.resolve "main.transactions.auth.sign_up" do |sign_up|
            sign_up.(r.env["omniauth.auth"]) do |m|
              m.success do |authentication|
                flash[:notice] = "SUccessfully authenticated"
              end
              m.failure do |message|
                flash[:alert] = "Validation error #{message}"
              end
              r.redirect "/"
            end
          end
        end
      end
    end
  end
end
