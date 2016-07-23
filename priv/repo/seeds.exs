# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixTodosApi.Repo.insert!(%PhoenixTodosApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PhoenixTodosApi.Repo
alias PhoenixTodosApi.Todo

Repo.insert!(%Todo{title: "Create the Phoenix App", is_completed: true})
Repo.insert!(%Todo{title: "Prepare the Ember App", is_completed: false})
Repo.insert!(%Todo{title: "Ensure the Apps Work Together", is_completed: false})
