module CardsHelper
  def cart_item(card)
    content_tag(:td) { card.original_text }
    content_tag(:td) { card.translated_text }
    content_tag(:td) { card.review_date.strftime("%d.%m.%Y %H:%M:%S") }
    content_tag(:td) { link_to t("card.actions.edit"), edit_card_path(card) }
    content_tag(:td) { link_to t("cart.actions.destroy"), card, method: :delete,
                      data: { confirm: t("card.actions.are_you_sure") } }
  end
end
