class AnkiDeck
  attr_accessor :type, :argument

  def initialize(type, argument = nil)
    @type = type
    @argument = argument
  end

  def generate_deck
    self.send(self.type.to_sym)
  end

  private

  def critical
    percentage = self.argument || 75
    critical_items = Wanikani::CriticalItems.critical(percentage.to_i)
    return nil if critical_items.empty?

    converter = AnkiDeck::Converter.new
    converter.critical_items_to_text(critical_items)
  end
end