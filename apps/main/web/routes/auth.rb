module Main
  class Application
    route "auth" do |r|
      r.on "todoist" do
        r.get "callback" do
          p r.env["omniauth.auth"]
          r.redirect "/"
        end
      end
    end
  end
end
