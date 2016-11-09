m4_include([stuff.m4])

m4_define([assert_equals],
	[m4_if(
		[$1],
		[$2],
		[],
		[m4_fatal([Item '$1' doesn't match '$2'.])])])


m4_list_append([FOO], [one])
m4_list_append([FOO], [two])

m4_list_append([BAR], [1])
m4_list_append([BAR], [2])

m4_list_append([BAZ], [foo])
m4_list_append([BAZ], [bar])

assert_equals(_lists_same_len([FOO,BAR], [OK], [KO]), OK)
assert_equals(_lists_same_len([FOO,BAR,BAZ], [OK], [KO]), OK)

m4_list_append([FUU], [foo])

_lists_same_len([FOO,BAR,BAZ,FUU], [m4_fatal([Lists don't have the same length])], )

m4_list_append([FUX], [foo])
m4_list_append([FUX], [bar])
m4_list_append([FUX], [baz])

assert_equals(_lists_same_len([FOO,BAR,BAZ,FUU], [m4_fatal([Lists don't have the same length])], OK), OK)
assert_equals(_lists_same_len([FUU,BAR,BAZ,FOO], [m4_fatal([Lists don't have the same length])], OK), OK)
assert_equals(_lists_same_len([FUU,BAZ,BAR,FOO], [m4_fatal([Lists don't have the same length])], OK), OK)

assert_equals(m4_lists_foreach([FOO,BAR],[fu,ba],[fu: ba@ ]), 
	[one: 1@ two: 2@ ])

assert_equals(m4_lists_foreach([FOO],[fu],[fu:]), 
	[one:two:])

assert_equals(m4_lists_foreach([FOO,BAR,BAZ],[fu,ba,za],[fu: ba-za@]), 
	[one: 1-foo@two: 2-bar@])