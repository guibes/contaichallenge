defmodule ContaichallengeWeb.Router do
  use ContaichallengeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ContaichallengeWeb do
    pipe_through :api

    post "/operations/:operation/:first_factor/:second_factor", OperationsController, :create
    get "/operations", OperationsController, :getall
  end

  def swagger_info do
    %{
      info: %{
        title: "Contaí Challenge"
      }
    }
  end

  scope "/api/swagger" do
    forward "/", PhoenixSwagger.Plug.SwaggerUI,
      otp_app: :contaichallenge,
      swagger_file: "swagger.json"
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: ContaichallengeWeb.Telemetry
    end
  end
end
