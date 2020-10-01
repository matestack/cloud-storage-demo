class DataItemManager::Pages::Show < Matestack::Ui::Page

  def data_item
    DataItem.find(params[:id])
  end

  def response
    heading_section_partial
    body_section_partial
  end

  def heading_section_partial
    div class: "row mb-5" do
      div class: "col-12" do
        transition path: data_items_path do
          small text: "back"
        end
      end
      div class: "col-12" do
        data_item_inline_edit data_item: data_item, attr: :name do
          heading size: 5 do
            plain data_item.name
          end
        end
        hr
      end
    end
  end

  def body_section_partial
    div class: "row" do
      div class: "col-md-6" do
        img class: "w-100", path: cropped_image_path
      end
      div class: "col-md-6 pl-5" do
        meta_infos_partial
        actions_section_partial
        comments_section_partial
      end
    end
  end

  def cropped_image_path
    rails_representation_path(data_item.attached_file.variant(
      resize_to_fill: [500, 500, { gravity: 'North' }]
    ), only_path: true)
  end

  def meta_infos_partial
    small text: "Type"
    paragraph text: data_item.attached_file.blob.content_type

    small text: "Size"
    paragraph text: "#{data_item.attached_file.blob.byte_size/1000} kb"

    small text: "Updated at"
    paragraph text: data_item.updated_at.strftime("%d.%m.%Y %H:%M")
  end

  def actions_section_partial
    link path: rails_blob_path(data_item.attached_file), target: "_blank",download: true do
      button class: "btn btn-sm btn-secondary", text: "download"
    end
    action delete_action_config(data_item.id) do
      button class: "btn btn-sm btn-danger", text: "delete"
    end
  end

  def delete_action_config data_item_id
    {
      path: data_item_path(data_item_id),
      method: :delete,
      confirm: true,
      success: {
        transition: {
          path: data_items_path
        }
      }
    }
  end

  def comments_section_partial
    div class: "row mt-5" do
      div class: "col-12 mt-2" do
        heading size: 5, text: "Comments"
        hr
      end
      comments_list_partial
    end
    comments_form_partial
  end

  def comments_list_partial
    async rerender_on: "comment_created", id: "comments" do
      data_item.comments.each do |comment|
        div class: "col-12 mt-2" do
          small class: "text-muted", text: "Some one | "
          small class: "text-muted", text: comment.created_at.strftime("%d.%m.%Y %H:%M")
          paragraph text: comment.body
        end
      end
    end
  end

  def comments_form_partial
    div class: "row" do
      div class: "col" do
        form create_comment_form do
          form_input key: :body, class: "form-control mb-3", type: :text
          form_submit do
            button class: "btn btn-sm btn-primary", text: "save"
          end
        end
      end
    end
  end

  def create_comment_form
    {
      for: Comment.new,
      path: data_item_comments_path(data_item_id: data_item.id),
      method: :post,
      success: {
        emit: "comment_created"
      }
    }
  end

end
