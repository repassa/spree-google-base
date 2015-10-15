Deface::Override.new(virtual_path: "spree/admin/shared/_configuration_menu",
                     name: "converted_admin_configurations_menu",
                     insert_bottom: "[data-hook='admin_configurations_sidebar_menu']",
                     partial: "spree/admin/google_base_link",
                     disabled: false)
