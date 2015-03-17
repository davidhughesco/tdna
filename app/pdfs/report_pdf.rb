class ReportPdf < Prawn::Document

  def initialize(candidate)
    super()
    @candidate = candidate
    header
    body
  end

  def header
    text @candidate.name, size: 15, style: :bold
  end

  def body
    text "This is a report."
  end

end