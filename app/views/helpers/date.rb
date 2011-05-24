module ViewHelpers
  def date
    self["created_at"].strftime("%B %d, %Y")
  end
end
