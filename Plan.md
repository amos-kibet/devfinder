## Plan

- Create http context to get user data from

  - Create a struct to hold user data
  - Create `get_user_data/1` function that makes http calls to `https://api.github.com/users/:username` and return user data
    - [Finch](https://hex.pm/packages/finch) http client will be used
  - Expose APIs to be used by controllers
    - `get_user/1:` returns a map of user data

- Create controllers to render user data

  - Implement actions on get_user controller
    - `get_user:` returns a map of user data
    - `prepare_user_data:` retrieves & returns fields required to be rendered on the UI:
      1. name(string)
      2. username(string)
      3. avatar_url(string)
      4. bio(string)
      5. created_at(string)
      6. public_repos(number)
      7. followers(number)
      8. following(number)
      9. location(string)
      10. twitter_username(string)
      11. blog(string)
      12. company(string)

- Create views to render user data

  - Create a view to render user data
    - Create styles to match requirements
      - Create styles for dark & light mode

- Finally, write appropriate tests
  - [Mox](https://hex.pm/packages/mox) will be used to mock client for outside-in tests
