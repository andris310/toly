module CartChecker
  extend ActiveSupport::Concern

    def is_downloadable?
      items = self.line_items.collect { |li| li[:variant].item }
      items.all? { |i| i.is_downloadable }
    end
  end

# @cart.line_items.map { |i| Product.where(id: i['product_id'])}