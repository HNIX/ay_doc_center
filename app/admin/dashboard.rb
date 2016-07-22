ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      columns do
          column do
            panel "Recent Documents" do
              table_for Document.order('created_at DESC').limit(5) do |document|
                column("Name")   {|document| link_to(document.name, admin_document_path(document))}
                column("Category"){|document| document.category.name }
                bool_column(:attachment)
                bool_column(:word)
                bool_column(:ppt)
              end
            end
          end

          column do
            panel "Recent Users" do
              table_for User.order('created_at DESC').limit(5) do |user|
                column("Name")   {|user| link_to(user.first_name + " " + user.last_name, admin_user_path(user)) if user.first_name && user.last_name}
                column("Title") {|user| user.title}
                column("Email") {|user| user.email}
              end
            end
          end
      end

      columns do 
        column do
            panel "Company Stats" do
              table_for CompanyStat.order('created_at DESC').limit(5) do |stat|
                column("Name")   {|stat| link_to(stat.name, admin_company_stat_path(stat))}
                column("Value") {|stat| stat.stat}
                column("Description") {|stat| stat.desc}
              end
            end
          end
          column do
            panel "Recent Categories" do
              table_for Category.order('created_at DESC').limit(5) do |category|
                column("Name")   {|category| link_to(category.name, admin_category_path(category))}
                column("Parent") {|category| category.parent.name}
                column("Documents") {|category| category.documents.count}
              end
            end
          end
      end  
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    

  end # content
end


# index do
#     selectable_column
#     id_column
#     column :first_name
#     column :last_name
#     column :title
#     column :email
#     column :office_phone
#     column :mobile_phone
#     actions
#   end