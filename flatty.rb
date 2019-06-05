# Flattens an array and returns the values either as unique or mixed
#
# @param [Array] input The array to flatten.
# @param [Boolean] unique Whether to pick only unique values or not. Defaults to
#   false
# @param [Array] result If calling this method from a recursion loop this
#   parameter can receive the parent input. nil by default.
# @return [Array] An array containing the flattened values.
def flatty(input, unique: false, result: nil)
  result ||= []

  input.each do |value|
    if value.is_a?(Array)
      flatty(value, result: result)
    else
      result.push(value)
    end
  end

  if unique
    result.uniq
  else
    result
  end
end
