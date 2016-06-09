# Topher's Rails 4.2.0 app template

This is a starter template I'll use when building new apps.

### Components

- Figaro. `application.yml` will be ignored by Git, so create it yourself.
- Mailgun for email sending
- Bootstrap (`bootstrap-sass` gem) with generic layout and Devise templates
- FontAwesome fonts
- ApplicationHelper #show_errors_for model validation helper
- Basic Minitest setup with starter tests
- Secret token is dynamically generated each time the server starts up

### To create a new app from it:

- Clone this repository
- `git remote remove origin`
- Review `Gemfile`
- `bundle install`
- Review `.gitignore`
- Replace `VanillaApp` and `vanilla_app`
- Review `config/initializers/devise.rb`
- Review Users migration. If any other fields are needed, update
  `app/views/devise/users/` templates and uncomment the params
  customizer in `ApplicationController`.
- Create `config/application.yml` (Figaro; see template).
  Ensure a unique Devise salt and pepper.
- Create `config/database.yml` (see template)
- `rake db:create db:migrate db:seed test:prepare`
- Run specs
- Rewrite this readme
- Push up to new repository
- Start on the fun stuff!

### Heroku prep

- Add gem `rails_12factor` in group `:production`
- `bundle install`
- `rake rails:update:bin`
- set `config.force_ssl = true` in production
- `heroku create`
- `git push heroku master`
- `heroku run rake db:migrate`
- `rake figaro:heroku`
- `heroku open` and test!

### Maintaining it

Keep this app up to date by periodically updating gems and config to reflect the habitual tweaks I make when starting a new app. One change here can save me tons of time with each sandbox app I spin up down the road.
