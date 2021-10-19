defmodule RockeliveryWeb.ItemsController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Items.Item
  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(connection, params) do
    with {:ok, %Item{} = item} <- Rockelivery.create_item(params) do
      connection
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end
end
