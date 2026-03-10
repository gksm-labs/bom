module ApplicationHelper
  NAVIGATION_LINKS = [
    { name: "O podujatí", path: "/#about" },
    { name: "Propozície", path: "/#propositions" },
    { name: "Trasa", path: "/#course" },
    { name: "Program", path: "/#schedule" },
    { name: "Partneri", path: "/#partners" },
    { name: "Kontakt", path: "/#contact" }
  ].freeze

  def navigation_links
    NAVIGATION_LINKS
  end
end
