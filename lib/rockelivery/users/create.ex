defmodule Rockelivery.Users.Create do
  alias Rockelivery.Error
  alias Rockelivery.Repo
  alias Rockelivery.Users.User
  alias Rockelivery.ViaCep.Client

  def call(params) do
    cep = Map.get(params, "cep")
    changeset = User.changeset(params)

    with {:ok, %User{}} <- User.build(changeset),
         {:ok, _cep_info} <- Client.get_cep_info(cep),
         {:ok, %User{}} = response <- Repo.insert(changeset) do
      response
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end

  def client do
    :rockelivery
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:via_cep_adapter)
  end
end
