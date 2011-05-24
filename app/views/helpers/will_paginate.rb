module ViewHelpers
  def previous_page
    if (self["current_page"] != 1)
      previous_page = (self["current_page"] == 2) ? nil : self["current_page"] - 1
      '<p class="left"><a href="/blog/' + previous_page.to_s + '">&larr; Previous page</a></p>'
    end
  end

  def next_page
    if (self["current_page"] != self["total_pages"])
      '<p class="right"><a href="/blog/' + (self["current_page"] + 1).to_s + '">Next page &rarr;</a></p>'
    end
  end
end
