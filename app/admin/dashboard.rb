ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
          h5 link_to (current_user.name.nil? ? '匿名用户' :  current_user.name), admin_user_path(current_user)
      end
    end
    columns do
      column do
        panel "最新供应" do
          ul do
            Provider.last(10).map do |post|
              hr
              li link_to("[#{post.id}:#{post.created_at.strftime('%b %a %H:%M')}]  #{post.title} [发布者:#{post.user.name.nil? ? '匿名用户' : post.user.name}]", admin_provider_path(post))
              
            end
          end
        end
      end

      column do
        panel "最新需求" do
          ul do
            Buyer.last(10).map do |post|
              hr
              li link_to("[#{post.id}:#{post.created_at.strftime('%b %a %H:%M')}]    #{post.title} [发布者:#{post.user.name.nil? ? '匿名用户' : post.user.name}]", admin_buyer_path(post))
            end
          end
        end
      end
      # column do
      #   panel "Info" do
      #     para "Welcome to ActiveAdmin."
      #   end
      # end
    end
  end # content
end
