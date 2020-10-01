class Components::DataItemInlineEdit < Matestack::Ui::Component

  requires :data_item
  requires :attr

  def response
    async rerender_on: "performed_for_#{attr}", id: "inline-edit-#{attr}" do
      toggle hide_on: "edit-#{attr}", init_show: true do
        onclick emit: "edit-#{attr}" do
          yield_components
        end
      end
      toggle show_on: "edit-#{attr}" do
        form update_form_config do
          form_input key: attr, type: :text, class: "form-control w-50"
          br
          form_submit do
            button class: "btn btn-sm btn-primary mt-1", text: "save"
          end
        end
      end
    end
  end

  def update_form_config
    {
      for: data_item,
      path: data_item_path,
      method: :put,
      success: {
        emit: "performed_for_#{attr}"
      }
    }
  end

end
