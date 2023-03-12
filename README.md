# Blog - Fullstack Phoenix App

## Generate project

```
mix phx.new blog
```

Follow the steps and cd into the blog. Create database with:

```
mix ecto.create
```

Run the tests:

```
mix test
```

Run the server:

```
mix phx.server
```

or:

```
iex -S mix phx.server
```

## Use generator to scaffold Post

Use `mix phx.gen.html` to generate controller, HTML views, and context for an HTML resource.

```
mix phx.gen.html Records Post posts title:string:unique body:text
```

The first argument is the context module, second is the schema module, third is table name, pluralized schema module name. Followed by column names with type.

Add the resource to your browser scope in `lib/blog_web/router.ex`:

```
resources "/posts", PostController
```

Run migrations:

```
mix ecto.migrate
```

## Use generator to scaffold authentication system

```
mix phx.gen.auth Accounts User users
```

## Change styling

**components/layouts/root.html.heex**

```
<body class="w-screen min-h-screen flex flex-col text-slate-900 leading-normal tracking-wide">
  <%= @inner_content %>
</body>
```

**components/layouts/app.html.heex**

```
<header class="w-full py-10 shadow-md">
  <section class="w-11/12 max-w-screen-xl mx-auto flex flex-col justify-center items-center gap-10">
    <div class="flex justify-between items-center w-full">
      <div>
        <.link class="font-bold underline decoration-brand decoration-4" href={~p"/"}>HOME</.link>
      </div>

      <ul class="flex items-center justify-center gap-5 font-bold text-sm">
        <%= if @current_user do %>
          <li class="flex items-center gap-1">
            <Heroicons.user class="h-6 w-6 stroke-current" />
            <span class="hidden sm:inline"><%= @current_user.email %></span>
          </li>

          <li>
            <.link href={~p"/users/settings"} class="flex items-center gap-1">
              <Heroicons.cog_6_tooth class="h-6 w-6 stroke-current" />
              <span>Settings</span>
            </.link>
          </li>

          <li class="hover:translate-y-[1px]">
            <.link
              href={~p"/users/log_out"}
              method="delete"
              class="border border-brand shadow-md shadow-brand/30 py-2 px-4 rounded-md font-semibold"
            >
              Log out
            </.link>
          </li>
        <% else %>
          <li class="hover:translate-y-[1px]">
            <.link
              href={~p"/users/register"}
              class="border border-brand shadow-md shadow-brand/30 py-2 px-4 rounded-md font-semibold"
            >
              Register
            </.link>
          </li>

          <li class="hover:translate-y-[1px]">
            <.link
              href={~p"/users/log_in"}
              class="border border-brand shadow-md shadow-brand/30 py-2 px-4 rounded-md font-semibold"
            >
              Log in
            </.link>
          </li>
        <% end %>
      </ul>
    </div>

    <nav class="w-full flex items-center justify-center gap-5 sm:gap-10">
      <.link class="font-bold" href={~p"/posts"}>ALL POSTS</.link>
      <%!-- TODO: ADD MY POSTS LINK --%>
      <.link class="font-bold" href={~p"/posts"}>MY POSTS</.link>
      <.link class="font-bold" href={~p"/posts/new"}>NEW POST</.link>
    </nav>
  </section>
</header>

<main class="w-full flex-1 flex py-20">
  <section class="w-11/12 max-w-screen-xl h-full mx-auto">
    <.flash_group flash={@flash} />
    <%= @inner_content %>
  </section>
</main>

<footer class="w-full bg-slate-900 text-white text-xs py-10 text-center">
  <section class="w-11/12 max-w-screen-xl mx-auto flex flex-col justify-center items-center gap-5">
    <h3>
      Application created for educational purposes only. Created by:
      <span class="uppercase tracking-widest font-bold text-brand">milica golocorbin</span>
    </h3>
    <.get_year />
    <div>
      <%!-- TODO: ADD SOCIAL ICONS --%>
      <p>ADD SOCIAL ICONS HERE</p>
    </div>
  </section>
</footer>
```

**components/layouts.ex**

```
defmodule BlogWeb.Layouts do
  use BlogWeb, :html

  embed_templates "layouts/*"

  def get_year(assigns) do
    {{year, _, _}, _} = :calendar.local_time()
    assigns = assign(assigns, :year, year)

    ~H"""
    <h3 class="font-bold"><%= @year %></h3>
    """
  end
end
```

### Add additional styles, change colors.
