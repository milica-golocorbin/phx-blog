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

## Change styling for `components/layouts/root.html.heex` and `components/layouts/app.html.heex`

## Add additional styles, change colors, fix failing test
