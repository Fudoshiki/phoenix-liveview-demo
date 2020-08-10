defmodule DemoWeb.PostLive.PostComponent do
    use DemoWeb, :live_component

    def render(assigns) do
        ~L"""
        <div class="card">
        <div id="post-<% @post.id %>" class= "post">
            <div class = "row">
                <div class= "column column-90 post-body">
                <b>@<%= @post.username %></b>
                <br/>
                <%= @post.body %>
                </div>
            </div>
            <div class = "row">
                <div class= "column">
                <a href="#" phx-click = "like" phx-target= "<%= @myself %>">
                <div>Like Count</div> 
                </a>
                <%= @post.likes_count %>
                </div>
            </div>

        </div>
        </div>
        """
    end
    def handle_event("like", _, socket) do
        Demo.Timeline.inc_likes(socket.assigns.post)
        {:noreply, socket}
    end
end