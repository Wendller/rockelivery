defmodule RockeliveryWeb.OrdersView do
  use RockeliveryWeb, :view

  alias Rockelivery.Orders.Order

  def render("create.json", %{order: %Order{} = order}) do
    %{
      message: "Order created",
      order: order
    }
  end
end
