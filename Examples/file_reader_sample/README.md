3. The attached file is real sample data from a company called Factual. Write a program that takes

attached file as input, and outputs a hash, whose keys are the fields from the first line of the input file, and 

whose values are array of 1) the character count of the longest occurrence of the data for that field, as 

well as the factual id for that longest occurrence.

If there is no field length > 0, please return "" instead of a factual_id (see the "chain_name" and "chain_id" 

fields in the output below).

Please keep in mind that this file is over 23 million lines long -- so your program should process each line 

as it is read, and it should be relatively efficient!

Make it so I can call this program by saying . . .

cat ./factual_101_rows.txt | ./your_program

. . . and get this output: 

{"factual_id"=>[36, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "name"=>[72, "900ba574-2cc5-4d22-

bf2e-92fb14412abf"], "address"=>[25, "9f56d3d6-f1e9-463c-b6b5-020bf2cd9492"], 

"address_extended"=>[8, "59e079c4-cb58-4d0f-854a-671157dfcb55"], "po_box"=>[13, "6ec565c0-2a8e-

49ea-82a9-b905369185e9"], "locality"=>[18, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "region"=>[2, 

"b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "post_town"=>[0, ""], "admin_region"=>[0, ""], 

"postcode"=>[5, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "country"=>[2, "b716c681-ad67-4c9c-aab4-

7f5fb39e3e11"], "tel"=>[14, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "fax"=>[14, "f9dfe097-74bf-469c-

a2c8-901c4a58a80e"], "latitude"=>[9, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "longitude"=>[11, 

"59e079c4-cb58-4d0f-854a-671157dfcb55"], "neighborhood"=>[57, "5598000e-23c4-4883-bc04-

538f29ac07e6"], "website"=>[41, "d65bf844-e07c-458d-8d27-10d7608bc79a"], "email"=>[28, "a1db9414-

01b4-4f7a-8cda-fbb7e007b04f"], "category_ids"=>[7, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], 

"category_labels"=>[88, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "status"=>[1, "b716c681-ad67-4c9c-

aab4-7f5fb39e3e11"], "chain_name"=>[0, ""], "chain_id"=>[0, ""]}

Meaning that 

-- the "factual_id" column's longest length in this file is 36 characters, and occurs where the factual_id == 

"b716c681-ad67-4c9c-aab4-7f5fb39e3e11"

-- the "name"'s longest length is 72 characters, and occurs where the factual_id == "900ba574-2cc5-

4d22-bf2e-92fb14412abf"

-- the "address"'s longest length is 25 characters, and occurs where the factual_id == "9f56d3d6-f1e9-

463c-b6b5-020bf2cd9492"

. . . and so on.

Ties are ok. For example, if factual_ids are all 36 characters long, just give me the factual_id for any one 

of them.