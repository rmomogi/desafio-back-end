class CnabWorker
  include Sidekiq::Worker

  def perform(cnab_id)
    ::CnabService.parse(cnab_id)
  end
end