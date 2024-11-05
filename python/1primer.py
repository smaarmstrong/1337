#!/usr/bin/env python3

# indentation
# python relies on indentation instead of curly braces
if x > 0:
    print("x is positive")
elif x == 0:
    print("x is zero")
else:
    print("x is negative")

# dynamic typing
# python doesn't require you to declare types such as Int, String, etc.

# int
x = 1
# float
y = 2.5

# string
name = "Alicia"

# boolean
valid = True

# operators
# the usual: + - * /
# the unusual: // % **

the_sum = x + y
difference = x - y
product = x * y
quotient = x / y
# etc.

# strings
# we can do single line and multi-line
hello = "hello world"
multi = """now is the winter
of our discontent"""

# control structures
# conditionals: if, elif, else (see lines 5,10 for a demonstration)
# iteration: for, while

for i in range(3):
    print(i)

i = 0
while i < 3:
    print(i)
    i += 1

# functions
# we define python functions with the keyword def.
# they take default parameter values, variable-
# length arguments, and keyword arguments.

def hello(person, hello="hiya")
    print(f"{hello}, {person}")
    
hello("Alicia")
hello("Gemma", "byebye")

# lists, tuples, dictionaries
# the most common built-in data types:
# lists - mutable; tuples - immutable; dictionaries - mutable w/ key-value pairs
the_list = [4, 5, 6]
the_tuple = (4, 5, 6)
the_dictionary = {'christian_name': 'gemma', 'age', '5'}

# type conversion
# aka type casting
x = 2 # int
y = float(2) # 2.0
z = str(x) # '2'
