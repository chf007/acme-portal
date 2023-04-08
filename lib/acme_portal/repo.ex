defmodule AcmePortal.Repo do
  use Ecto.Repo,
    otp_app: :acme_portal,
    adapter: Ecto.Adapters.Postgres
end
