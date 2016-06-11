# Quotes App

### Components

- Figaro. `application.yml` will be ignored by Git, so create it yourself.
- Mailgun for email sending
- Bootstrap (`bootstrap-sass` gem) with generic layout and Devise templates
- FontAwesome fonts
- ApplicationHelper #show_errors_for model validation helper
- Basic Minitest setup with starter tests
- Secret token is dynamically generated each time the server starts up

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
