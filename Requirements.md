## Project Requirements

Application users should be able to:

- View the optimal layout for the app depending on their device's screen size
- See hover states for all interactive elements on the page
- Search for GitHub users by their username
- See relevant user information based on their search
- Switch between light and dark themes
- **Bonus:** Have the correct color scheme chosen for them based on their computer preferences. Hint: Research `prefers-color-scheme` in CSS.

## Expected behaviour

- On first load, show the profile information for the searched user.
- Display an error message if no user is found when a new search is made.
- If a GitHub user hasn't added their name, show their username where the name would be without the `@` symbol and again below with the `@` symbol.
- If a GitHub user's bio is empty, show the text "This profile has no bio" with transparency added.
- If any of the location, website, twitter, or company properties are empty, show the text "Not Available" with transparency added
- Website, twitter, and company information should all be links to those resaources. For the company link, it should remove the `@` symbol and link to the company page on GitHub.
