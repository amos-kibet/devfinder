export const hooks = {
  CurrentThemeToggle: {
    updated() {
      const theme = this.el.dataset.theme;
      const html = document.querySelector("html");

      html.classList.remove("dark");
      html.classList.remove("light");
      html.classList.add(theme);
    },
  },
};
