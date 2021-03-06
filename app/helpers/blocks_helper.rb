module BlocksHelper
  def block_item(block)
    content_tag(:td, block.title)

    if block.current?
      content_tag(:td) do
        link_to t("block.actions.make_ordinary"), reset_as_current_block_path(block), method: :put
      end
    else
      content_tag(:td) do
        link_to t("block.actions.make_current"), set_as_current_block_path(block), method: :put
      end
    end

    content_tag(:td) do
      link_to t("block.actions.edit"), edit_block_path(block)
    end

    content_tag(:td) do
      link_to t("block.actions.destroy"), block, method: :delete, data: { confirm: "Удалить колоду?" }
    end
  end
end
