module ScreensHelper
  def link_to_switch(screen, channel)
    assignment = Assignment.find_by_screen_id_and_channel_id(screen,channel)
    if assignment
      link_to "on", unbind_screen_path(screen, :channel => channel), :method => :put, :confirm => "Are you sure?", :class => "on switch"
    else
      link_to "off", bind_screen_path(screen, :channel => channel), :method => :put, :confirm => "Are you sure?", :class => "off switch"
    end
  end
end
