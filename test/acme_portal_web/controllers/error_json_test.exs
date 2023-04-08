defmodule AcmePortalWeb.ErrorJSONTest do
  use AcmePortalWeb.ConnCase, async: true

  test "renders 404" do
    assert AcmePortalWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert AcmePortalWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
