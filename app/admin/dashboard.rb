ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do

      span class: "blank_slate" do
        span Users
        small User.count
      end

      span class: "blank_slate" do
        span "Books"
        small Book.count
      end

      span class: "blank_slate" do
        span "Reviews"
        small Review.count
      end

      span class: "blank_slate" do
        span "Order"
        small Order.count
      end

    end

  end

end
