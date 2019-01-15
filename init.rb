Redmine::Plugin.register :redmine_layim do
  name 'Redmine Layim plugin'
  author 'Tigergm Wu'
  description 'This is a layim plugin for Redmine'
  version '0.0.2'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  settings :default => {
    :layim_enabled => 1,
    :layim_min_title => "RIM即时通讯",
    }, :partial => 'settings/layim'
 
end

require_dependency 'redmine_layim_hook_listener'