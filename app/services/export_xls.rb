class ExportXls
  TITLE_COLUMN = ["Title", "Description", "Price"]

  def perform
    initialize_attributes
    return unless create_file
    Team.each do |team|
      add_data_to_files team
      team.members.each do |member|
        add_data_to_files member
      end
    end
    save_file
  end

  def initialize_attributes
    budget_dates = []
    @deadlines = []
    @files = []
    (Date.today.cweek..Date.today.end_of_year.cweek).to_a.map do |d|
      deadlines << Date.commercial(Date.today.year, d, 7)
      date = Date.commercial(Date.today.year, d, 1)
      budget_dates << date.date.to_s
    end
    @first_row = [*TITLE_COLUMN, *budget_dates]
  end

  def create_files
    BudgetType.pluck(:name).each_with_index do |file_name, index|
      package = Axlsx::Package.new
      workbook = package.workbook
      workbook.add_worksheet(name: file_name) do |sheet|
        sheet.add_row first_row
      end
      files << package
    end
  end

  def add_data_to_files object
    budgets = object.budgets.deadlines_in deadlines
    info = [object.id, object.name, object.birthday]
    files.each do |file|
      row = [*info, *budgets]
      file.workbook.worksheets.first.add_row row
    end
  end

  def save_file
    files.each do |file|
      file.serialize "#{file.workbook.worksheets.first.name}.xls"
    end
  end
end