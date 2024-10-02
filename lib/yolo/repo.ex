defmodule Yolo.Repo do
  use Ecto.Repo,
    otp_app: :yolo,
    adapter: Ecto.Adapters.Postgres
end
