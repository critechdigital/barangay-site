module ApplicationHelper
  def public_nav_link(label, path)
    active = request.path == path
    link_to label, path, class: "px-4 py-3 text-sm font-medium whitespace-nowrap transition #{
      active ? 'text-white bg-blue-900 border-b-2 border-yellow-400' : 'text-blue-100 hover:text-white hover:bg-blue-700'
    }"
  end
end
