module Main
  class Application
    route "auth" do |r|
      r.on "todoist" do
        r.get "callback" do
          r.resolve "main.operations.authentications.create" do |create_authentication|
            create_authentication.(r.env["omniauth.auth"]) do |m|
              m.success do |refund|
                r.redirect "/"
              end
              m.failure do |message|
                p message
              end
            end
          end
        end
      end
    end
  end
end
