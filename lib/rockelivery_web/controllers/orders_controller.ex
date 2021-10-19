defmodule RockeliveryWeb.OrdersController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Orders.Order
  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(connection, params) do
    with {:ok, %Order{} = order} <- Rockelivery.create_order(params) do
      connection
      |> put_status(:created)
      |> render("create.json", order: order)
    end
  end
end
