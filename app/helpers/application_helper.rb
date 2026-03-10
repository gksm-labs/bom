module ApplicationHelper
  NAVIGATION_LINKS = [
    { name: "O podujatí", path: "/#about" },
    { name: "Propozície", path: "/#propositions" },
    { name: "Trasa", path: "/#course" },
    { name: "Program", path: "/#schedule" },
    { name: "Partneri", path: "/#partners" },
    { name: "Kontakt", path: "/#contact" }
  ].freeze

  BADGE_BG_CLASSES = {
    "primary" => "bg-primary",
    "red"     => "bg-red",
    "green"   => "bg-green"
  }.freeze

  def navigation_links
    NAVIGATION_LINKS
  end

  def schedule_badge_class(color)
    BADGE_BG_CLASSES[color] || "bg-primary"
  end
end
