class DataItemManager::Pages::Index < Matestack::Ui::Page

  def response
    div class: "row" do
      div class: "col" do
        plain "hello"
        # upload_form_partial
      end
    end
    div class: "row mt-5" do
      div class: "col" do
        # data_items_list_partial
      end
    end
  end

  # def upload_form_partial
  #   form form_config do
  #     form_input id: "file-upload", key: :attached_file, type: :file
  #     br
  #     br
  #     form_submit do
  #       button text: "upload", class: "btn btn-sm btn-primary"
  #     end
  #   end
  #   hr
  # end
  # #
  # def form_config
  #   {
  #     multipart: true,
  #     for: DataItem.new,
  #     path: data_items_path,
  #     method: :post,
  #     success: {
  #       emit: "uploaded"
  #     }
  #   }
  # end
  # #
  # def data_items_list_partial
  #   async rerender_on: "uploaded, deleted", id: "data-item-list" do
  #     DataItem.all.each do |data_item|
  #       item_row_partial data_item
  #     end
  #   end
  # end
  # #
  # def item_row_partial data_item
  #   hr
  #   div class: "row" do
  #     div class: "col-md-1" do
  #       transition path: data_item_path(data_item.id) do
  #         img class: "w-100", path: cropped_image_path(data_item)
  #       end
  #     end
  #     div class: "col-md-4" do
  #       small text: data_item.name
  #     end
  #     div class: "col-md-3 align-middle" do
  #       small text: data_item.updated_at.strftime("%d.%m.%Y %H:%M")
  #     end
  #     div class: "col-md-4 text-right" do
  #       link path: rails_blob_path(data_item.attached_file),
  #         target: "_blank", download: true do
  #           button class: "btn btn-sm btn-secondary", text: "download"
  #       end
  #       action delete_action_config(data_item.id) do
  #         button class: "btn btn-sm btn-danger", text: "delete"
  #       end
  #     end
  #   end
  # end
  #
  # def cropped_image_path data_item
  #   rails_representation_path(data_item.attached_file.variant(
  #     resize_to_fill: [100, 100, { gravity: 'North' }]
  #   ), only_path: true)
  # end
  #
  # def delete_action_config data_item_id
  #   {
  #     path: data_item_path(data_item_id),
  #     method: :delete,
  #     confirm: true,
  #     success: {
  #       emit: "deleted"
  #     }
  #   }
  # end



  # #
  # # def order_section_partial
  # #   if params[:sort_name] == "desc"
  # #     target_ordering = :asc
  # #     icon_class = "fas fa-arrow-down"
  # #   else
  # #     target_ordering = :desc
  # #     icon_class = "fas fa-arrow-up"
  # #   end
  # #
  # #   div class: "row mb-2" do
  # #     div class: "col" do
  # #       transition path: data_items_path(sort_name: target_ordering),
  # #         class: "text-decoration-none text-muted" do
  # #           small do
  # #             plain "Name"
  # #             icon class: icon_class
  # #           end
  # #       end
  # #     end
  # #   end
  # # end
  # #
  # # def data_items
  # #   if params[:sort_name] == "desc"
  # #     DataItem.all.order(name: :desc)
  # #   else
  # #     DataItem.all.order(name: :asc)
  # #   end
  # # end

end
