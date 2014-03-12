class Tourfifo
  def initialize
    @store = Array.new(4)
  end

  def add(element)
    unless @store.include? element
      @store.unshift(element)
      @store.pop
    end
    return @store - [element]
  end
  def view
    self
  end
end