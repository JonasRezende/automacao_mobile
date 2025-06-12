World(Actions)

Then('troco para a carteirinha inativa') do
  puts '🔄 Trocando para a carteirinha inativa'
  card_exchange.open_card_selector
  card_exchange.select_inactive_card
end
