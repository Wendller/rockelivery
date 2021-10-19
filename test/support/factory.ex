defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.Users.User

  def user_params_factory do
    %{
      "age" => 24,
      "address" => "Rua dos mockeds",
      "cpf" => "12345678900",
      "cep" => "01001000",
      "name" => "mocked",
      "email" => "mock@mail.com",
      "password" => "123456"
    }
  end

  def user_factory do
    %User{
      age: 24,
      address: "Rua dos mockeds",
      cpf: "12345678900",
      cep: "64000000",
      name: "mocked",
      email: "mock@mail.com",
      password: "123456",
      id: "9ff8cc9c-fe79-4209-b3be-8a153b900db0"
    }
  end

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
