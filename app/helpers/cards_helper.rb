module CardsHelper
  def card_item(card)
    content_tag(:tr, class: "table table-hover table-condensed") do
      concat(content_tag(:td) { card.original_text })
      concat(content_tag(:td) { card.translated_text })
      concat(content_tag(:td) do
        card.review_date.strftime("%d.%m.%Y %H:%M:%S")
      end)
      concat(content_tag(:td) do
        link_to t("card.actions.edit"), edit_card_path(card)
      end)
      concat(content_tag(:td) do
        link_to(t("cart.actions.destroy"), card, method: :delete, data: { confirm: t("card.actions.are_you_sure") })
      end)
    end
  end
end
