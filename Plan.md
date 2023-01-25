## Plan

- Create http context to get user data from [GitHub](https://api.github.com/users/)

  - Create a struct to hold user data
  - Create `find_dev/1` function that makes http calls to `https://api.github.com/users/:username` and return user data
    - [Finch](https://hex.pm/packages/finch) http client will be used
  - Expose APIs to be used by controllers
    - `get_user_data/1:` returns a map of user data

- Create a live view to render user data

  - Implement a live view to render GitHub user profile in the UI
    - `get_user:` returns a map of user data
    - `prepare_user_data:` retrieves & returns fields required to be rendered on the UI:
      1. name(string)
      2. username(string)
      3. avatar_url(string)
      4. bio(string)
      5. created_at(string)
      6. profile_stats(map of public_repos, followers & following)
      7. location(string)
      8. twitter_username(string)
      9. blog(string)
      10. company(string)

- Create a live view template to render user data

  - Create a view to render user data
    - Create styles to match requirements
    - Create styles for dark & light mode

- Write appropriate tests

  - [Mox](https://hex.pm/packages/mox) will be used to mock client for outside-in tests

- Finally, deploy the application to [flyio](https://fly.io)
  - Deployed version: [devfinder](https://devfinder.fly.dev/)
