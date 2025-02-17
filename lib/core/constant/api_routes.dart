class ApiRoutes {
  static const login = "/login";
  static const register = "/register";
  static const getCategories = "/categories";
  static getProducts(int categoryId) => "/products/$categoryId";
  static const coverImage = "/cover_image";
  static const like = "/like";
  static const unlike = "/unlike";
}
