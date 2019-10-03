# frozen_string_literal: true

class CnabService
  def self.parse(cnab_id)
    cnab = Cnab.find cnab_id
    return true if cnab.status.eql? 'processed'

    file_content = File.open cnab.document.file.path
    file_content.readlines.each do |line|
      save(line)
    end

    cnab.update(status: 'processed', processed_at: DateTime.current)
  rescue Exception => ex
  end

  private

  def self.save(line)
    transaction_type = find_transaction_type(line)
    store = find_store(line)

    Transaction.create(transaction_type: transaction_type,
                       occurrence_at: (Time.parse line[1, 8] + ' ' + line[42, 6]),
                       value: line[9, 10].to_f / 100,
                       cpf: line[19, 11],
                       card: line[30, 12],
                       store: store)
  end

  def self.find_store(line)
    Store.where(name: line[62, 19].delete!("\n").strip, owner: line[48, 14].strip).first_or_initialize
  end

  def self.find_transaction_type(line)
    TransactionType.find line[0, 1]
  end
end
