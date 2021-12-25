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
            <i class="far fa-heart"></i> <%= @post.likes_count %>
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
end
