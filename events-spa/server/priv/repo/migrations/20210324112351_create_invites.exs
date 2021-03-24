defmodule Events.Repo.Migrations.CreateInvites do
  use Ecto.Migration

  def change do
    create table(:invites) do
      add :email, :string, null: false
      add :response, :string, null: true
      add :user_id, references(:users, on_delete: :nothing), null: true
      add :post_id, references(:posts, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:invites, [:user_id])
    create index(:invites, [:post_id])
  end
end
