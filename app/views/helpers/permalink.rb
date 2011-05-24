module ViewHelpers
  def permalink
    "/blog/" + self["created_at"].year.to_s + "/" + self["created_at"].month.to_s + "/" + self["created_at"].day.to_s + "/" + self["slug"]
  end
end
