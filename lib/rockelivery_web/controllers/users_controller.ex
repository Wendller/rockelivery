defmodule RockeliveryWeb.UsersController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Users.User
  alias RockeliveryWeb.Auth.Guardian
  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(connection, params) do
    with {:ok, %User{} = user} <- Rockelivery.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      connection
      |> put_status(:created)
      |> render("create.json", token: token, user: user)
    end
  end

  def show(connection, %{"id" => id}) do
    with {:ok, %User{} = user} <- Rockelivery.get_user_by_id(id) do
      connection
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def sign_in(connection, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      connection
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end

  def delete(connection, %{"id" => id}) do
    with {:ok, %User{}} <- Rockelivery.delete_user(id) do
      connection
      |> put_status(:no_content)
      |> text("")
    end
  end

  def update(connection, params) do
    with {:ok, %User{} = user} <- Rockelivery.update_user(params) do
      connection
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end
end
