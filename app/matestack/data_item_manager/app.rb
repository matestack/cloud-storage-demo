class DataItemManager::App < Matestack::Ui::App

  def response
    div class: "container mt-5" do
      heading size: 3, text: "Cloud Storage Demo"
      div class: "mt-5" do
        yield_page
      end
    end
  end

end
