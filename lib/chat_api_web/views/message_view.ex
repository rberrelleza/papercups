defmodule ChatApiWeb.MessageView do
  use ChatApiWeb, :view
  alias ChatApiWeb.{MessageView, UserView}

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, MessageView, "message.json")}
  end

  def render("show.json", %{message: message}) do
    %{data: render_one(message, MessageView, "message.json")}
  end

  def render("message.json", %{message: message}) do
    data = %{
      id: message.id,
      body: message.body,
      created_at: message.inserted_at,
      customer_id: message.customer_id,
      conversation_id: message.conversation_id,
      user_id: message.user_id
    }

    case message do
      %{user: %ChatApi.Users.User{} = user} ->
        Map.merge(data, %{
          agent: render_one(user, UserView, "user.json")
        })

      _ ->
        data
    end
  end
end
