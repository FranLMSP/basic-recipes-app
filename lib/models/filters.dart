class Filters {
  bool glutenFree;
  bool vegetarian;
  bool vegan;
  bool lactoseFree;

  Filters({
    this.glutenFree = false,
    this.vegetarian = false,
    this.vegan = false,
    this.lactoseFree = false,
  });

  Filters copy() {
    return Filters(
      glutenFree: glutenFree,
      vegetarian: vegetarian,
      vegan: vegan,
      lactoseFree: lactoseFree,
    );
  }
}