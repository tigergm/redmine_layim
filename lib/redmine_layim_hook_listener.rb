class RedmineLayimHookListener < Redmine::Hook::ViewListener
  render_on :view_layouts_base_html_head, :partial => "layim/layouts_base_html_head"
  render_on :view_layouts_base_body_top, :partial => "layim/layouts_base_body_top"
end