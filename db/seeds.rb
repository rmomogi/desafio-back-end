values = [{ name: 'debit', operation: 'entry'},
          { name: 'invoice', operation: 'output' },
          { name: 'financing', operation: 'output' },
          { name: 'credit', operation: 'entry' },
          { name: 'loan_receipt', operation: 'entry' },
          { name: 'sales', operation: 'entry' },
          { name: 'ted_receipt', operation: 'entry' },
          { name: 'doc_receipt', operation: 'entry' },
          { name: 'rental', operation: 'output' }]

values.each do |value|
  TransactionType.create(name: value[:name], operation: value[:operation])
end
