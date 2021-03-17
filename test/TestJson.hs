test_string :: JValue
test_string = JString "foo"

test_number :: JValue
test_number = JNumber 2.7

test_array :: JValue
test_array = JArray [JNumber (-3.14), JBool True, JNull, JString "a string"]

test_object :: JValue
test_object = JObject [ ("numbers", JArray [JNumber 1, JNumber 2, JNumber 3, JNumber 4, JNumber 5])
                      , ("useful", JBool False)
                      ]
                      
prop_render_string :: Bool
prop_render_string = renderJValue test_string == "\"foo\""

prop_render_number :: Bool
prop_render_number = renderJValue test_number == "2.7"

prop_render_bool :: Bool
prop_render_bool = renderJValue (JBool True) == "true"

prop_render_array :: Bool
prop_render_array = renderJValue test_array == "[-3.14, true, null, \"a string\"]"

prop_render_object :: Bool
prop_render_object = renderJValue test_object == "{\"numbers\": [1.0, 2.0, 3.0, 4.0, 5.0], \"useful\": false}"
