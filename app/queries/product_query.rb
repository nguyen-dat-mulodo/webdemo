class ProductQuery
  SORT_OPTIONS = [:by_date, :by_title, :by_category].freeze
  def initialize(params={}, products = Product.all)
    @products = products.extending(Scopes)
    @params = params
  end

  def all
    @products.public_send(sort_by, type)
  end

  private

  def sort_by
    @params[:sort].presence_in(SORT_OPTIONS) || :by_date
  end

  def type
    @params[:type] == "asc" ? :asc : :desc
  end

  # Extended by scopes
  module Scopes
    def by_title(type)
      order(title: type)
    end

    def by_date(type)
      order(created_at: type)
    end

    def by_category(type)
      order("categories.id #{type}")
    end
  end
end
