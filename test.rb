require 'minitest/autorun'
require 'minitest/pride'
require 'awesome_print'
require_relative 'flatty'

# Too lazy to document the tests; they say they should be self explanatory!
class TestFlatty < MiniTest::Test

  # Defines the test data matrix to be used
  TEST_DATA = [
    1,
    2,
    [
      3,
      4
    ],
    5,
    [
      6,
      [
        'apple',
        'pear',
        'banana',
        7,
        8,
        [
          'ripe',
          'green',
          [
            7,
            8,
            [
              9,
              10,
            ],
            11
          ]
        ],
        11
      ],
      12
    ]
  ]

  # Defines the expected data when we don't want unique values
  EXPECTED_MIXED_DATA = [
    1,
    2,
    3,
    4,
    5,
    6,
    'apple',
    'pear',
    'banana',
    7,
    8,
    'ripe',
    'green',
    7,
    8,
    9,
    10,
    11,
    11,
    12
  ]

  # Defines the expected data when we want unique values
  EXPECTED_UNIQUE_DATA = [
    1,
    2,
    3,
    4,
    5,
    6,
    'apple',
    'pear',
    'banana',
    7,
    8,
    'ripe',
    'green',
    9,
    10,
    11,
    12
  ]

  # Prepares the tests...
  def setup
    puts "\nWill use the following test data matrix:\n"
    ap TEST_DATA
    puts "Starting test..."
  end

  # Prints out finishing results
  def teardown
    puts "\nResult is:\n"
    ap @result
  end

  # Tests that the method can yield a flattened unique set of data
  def test_unique_flattening
    @result = flatty(TEST_DATA, unique: true)
    assert_equal(EXPECTED_UNIQUE_DATA, @result)
  end

  # Tests that the method can yield a mixed/duplicate set of data
  def test_mixed_flattening
    @result = flatty(TEST_DATA)
    assert_equal(EXPECTED_MIXED_DATA, @result)
  end

end
