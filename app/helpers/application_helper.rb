module ApplicationHelper
  def navigation_links
    [
      { name: "O podujatí", path: "/#about" },
      { name: "Propozície", path: "/#propositions" },
      { name: "Trasa", path: "/#course" },
      { name: "Program", path: "/#schedule" },
      { name: "Partneri", path: "/#partners" },
      { name: "Kontakt", path: "/#contact" }
    ]
  end
end
