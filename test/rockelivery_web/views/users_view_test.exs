defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json " do
    user = build(:user)
    token = "xpto1234"

    response = render(UsersView, "create.json", token: token, user: user)

    assert %{
             message: "User created",
             token: "xpto1234",
             user: %Rockelivery.Users.User{
               address: "Rua dos mockeds",
               age: 24,
               cep: "64000000",
               cpf: "12345678900",
               email: "mock@mail.com",
               id: "9ff8cc9c-fe79-4209-b3be-8a153b900db0",
               inserted_at: nil,
               name: "mocked",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } == response
  end
end
