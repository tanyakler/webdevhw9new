# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Events.Repo.insert!(%Events.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
alias Events.Repo
alias Events.Users.User
alias Events.Posts.Post

alice = Repo.insert!(%User{
	name: "Alice",
	email: "alice@gmail.com",
	password_hash: "12345"}
)

bob = Repo.insert!(%User{
	name: "Bob",
	email: "bob@gmail.com",
	password_hash: "abcde"}
)
Repo.insert!(%Event{
	user_id: alice.id,
	name: "Alice's bday",
	date: "2021 Nov 3, 8:00 PM",
	description: "There will be cake."}
)
Repo.insert!(%Event{
	user_id: bob.id,
	name: "bob's hs graduation",
	date: "2021 June 12, 3:00PM",
	description: "just graduated!"}
)
