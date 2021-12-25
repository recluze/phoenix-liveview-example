defmodule YakWeb.PostLive.PostComponent do
  use YakWeb, :live_component

  def render(assigns) do
    ~H"""
    <div id={ "post-#{@post.id}"} class="post">
      <div class="row">
        <div class="column column-10">
          <div class="post-avatar">
          </div>
        </div>
        <div class="column column-90 post-body">
          <b>@<%= @post.username %></b> <br />
          <%= @post.body %>
        </div>
      </div>

      <div class="row">
      <div class="column-50 column"></div>
        <div class="column">
          <a href="#" phx-click="like" phx-target={@myself}>
            <i class="far fa-heart"></i> <%= @post.likes_count %>
          </a>
        </div>
        <div class="column">
            <i class="far fa-retweet"></i> <%= @post.reposts_count %>
        </div>
        <div class="column">
          <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
            <i class="far fa-edit"></i>
          <% end %>
          <%= link to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Are you sure?"] do %>
            <i class="far fa-trash"></i>
          <% end %>
        </div>

      </div>

    </div>
    """
  end


  def handle_event("like", _, socket) do
    Yak.Timeline.inc_likes(socket.assigns.post)
    {:noreply, socket}  # updates will be handled by existing infrastructure
  end
end
