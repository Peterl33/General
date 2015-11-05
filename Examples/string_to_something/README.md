1. Convert this string

string = "{key:[[value_1, value_2],[value_3, value4]], 5:10:00AM]}"

to this hash:

h = {"key" => [["value_1", "value_2"],["value_3", "value4"]], 5=>"10:00AM"}

then convert h to JSON.

Please note that the brackets are unbalanced on purpose.