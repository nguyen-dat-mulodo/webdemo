module CodeConventionHelper
  # Use two spaces per indentation level (aka soft tabs). No hard tabs.
  def some_method1
    do_something
  end

  # Use empty lines between method definitions and also to break up a method into logical paragraphs internally.
  def some_method2
    data = initialize(options)

    data.manipulate!

    data.result
  end

  # Avoid comma after the last parameter in a method call, especially when the parameters are not on separate lines.
  def some_method3(size, count, color)
    do_something
  end

  # Use spaces around the = operator when assigning default values to method parameters
  def some_method4(arg1 = :default, arg2 = nil, arg3 = [])
    do_something
  end

  # Use snake_case for symbols, methods and variables.
  :some_symbol

  def some_method5
    do_something
  end

  # Use CamelCase for classes and modules. (Keep acronyms like HTTP, RFC, XML uppercase.)
  class SomeClass
  end

  class SomeXML
  end

  # Align the parameters of a method call if they span more than one line.
  # When aligning parameters is not appropriate due to line-length constraints,
  # single indent for the lines after the first is also acceptable.
  def send_mail(source)
    Mailer.deliver(to: 'aaa@example.com',
                   from: 'bbb@example.com',
                   subject: 'Important message',
                   body: source.body)
  end

  # Avoid the use of attr. Use attr_reader and attr_accessor instead.
  class Person
    attr_accessor :something
    attr_reader :first_name, :last_name
  end

  def some_method6
    # Always use the new "sexy" validations
    validates :title, length: { minimum: 5, maximum: 50 }, uniqueness: true,  presence: true

    # Don't use Time.parse
    Time.zone.parse('2017-01-23 10:30:30')

    # Don't use Time.now
    Time.zone.now

    # Avoid string interpolation in queries, as it will make your code susceptible to SQL injection attacks.
    Client.where('orders_count = ?', params[:orders])

    # Favor the use of find over where when you need to retrieve a single record by id.
    User.find(id)

    # Favor the use of find_by over where and find_by_attribute when you need to retrieve a single record by some attributes.
    User.find_by(first_name: 'Bruce', last_name: 'Wayne')

    # Favor the use of where.not over SQL.
    User.where.not(id: id)

    # Constants
    # COLORS = %w(red green blue)

    # Prefer self[:attribute] = value over write_attribute(:attribute, value)
    # Add underscores to large numeric literals to improve their readability.
    def amount
      self[:amount] * 1_000_000
    end

    # Use spaces around operators, after commas, colons and semicolons
    sum = 1 + 2
    a, b = 1, 2

    # There are a few exceptions:
    e = M * c**2
    o_scale = 1/48r

    # Always put the condition on the same line as the if/unless in a multi-line conditional.
    if some_condition
      do_something
      do_something_else
    end
    
    # Favor the ternary operator(?:) over if/then/else/end constructs.
    result = some_condition ? something : something_else

    # Use ! instead of not.
    x = !something

    # The 'and' and 'or' keywords are banned. It's just not worth it. Always use && and || instead.
    if some_condition && some_other_condition
      do_something
    end

    document.saved? || document.save!

    # Don't use parentheses around the condition of an if/unless/while/until
    if x > 10
      do_something
    end

    # Don't use ||= to initialize boolean variables.
    enabled = true if enabled.nil?

    # Never put a space between a method name and the opening parenthesis.
    f(3 + 2) + 1

    # No space inside range literals.
    (1..50).to_a[41]
    [1, 2].include? 1

    # Indent 'when' as deep as 'case'
    kind = case year
           when 1970..1979 then '7x'
           when 1980..1989 then '8x'
           when 1990..1999 then '9x'
           when 2000..2009 then '10x'
           else 'baby'
           end

    # Favor the use of predicate methods to explicit comparisons with ==. Numeric comparisons are OK.
    if @x.even?
    end

    if @x.odd?
    end

    if @x.nil?
    end

    # Prefer Ruby's comparison operators over ActiveSupport's Array#inquiry, Numeric#inquiry and String#inquiry
    ruby = 'two'
    ruby == 'two'

    pets = %w(cat dog)
    pets.include? 'cat'

    0 > 0
    0 < 0

    # Favor the use of Array#join over the fairly cryptic Array#* with a string argument.
    %w(one two three).join(', ')

    # Use ranges or Comparable#between? instead of complex comparison logic when possible.
    do_something if (1000..2000).include?(x)

    do_something if x.between?(1000, 2000)

    # Prefer literal array and hash creation notation
    arr = []
    hash = {}

    # Avoid comma after the last item of an Array or Hash literal, especially when the items are not on separate lines.
    arr = [1001, 2020, 3333]
    # Prefer symbols instead of strings as hash keys.
    hash = { one: 1, two: 2, three: 3 }

    # No space after !
    !something

    # Prefer string interpolation instead of string concatenation:
    email_with_name = "#{user.name} <#{user.email}>"

    # Prefer single-quoted strings when you don't need string interpolation or special symbols such as \t, \n, ', etc.
    name = 'Bozhidar'
  end
end
