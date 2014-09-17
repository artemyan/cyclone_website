# Contains methods for menu links display
module MenuLinks
  # Displays links in main menu
  # @note used in layout
  def main_menu_links
    data.main_menu_links
  end


  # Displays links in sidebar of non facilities pages
  # @note is called in contact.html and others
  def shared_sidebar_menu_links
    data.main_menu_links.dup << data.contacts.first
  end


  # Returns links for a facilities page sidebar
  # @note is called at facilities page
  # @note facilities must be last in main_menu_links or it should be changed
  def facilities_sidebar_links
    data.categories.dup << data.main_menu_links.last
  end
end