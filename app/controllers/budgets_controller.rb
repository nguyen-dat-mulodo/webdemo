class BudgetsController < ApplicationController
  def index
    if ExportService.download
      zip = ZipBudgets.perform BudgetType.pluck(:name)
      send_file zip.path, type: "application/zip", x_sendfile: true,
                disposition: "attachment", filename: "Budgets.zip"
    end
  end
end