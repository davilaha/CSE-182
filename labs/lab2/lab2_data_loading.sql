-- Script file to Populate a Zoo DB
-- Populate the tables
COPY Keepers FROM stdin USING DELIMITERS '|';
1|Boris Kelly|1/2/20|A|88
2|Joe Biden|12/21/19|B|211.1
3|Joseph Smith|2/21/19|B|511.1
4|Allen Miller|1/19/19|C|11110.12
\.

COPY Cages FROM stdin USING DELIMITERS '|';
201|N|1
202|N|1
203|N|1
204|E|2
205|W|3
206|S|4
207|E|4
\.

COPY Species FROM stdin USING DELIMITERS '|';
401|tiger|Panthera|3
402|leopard|Panthera|1
403|jaguar|Panthera|2
404|lion|Panthera|3
405|panther|Puma|1
406|cougar|Puma|3
407|small cat|\N|2
\.

COPY Animals FROM stdin USING DELIMITERS '|';
10001|Saber|401|1|201
10002|Felice|401|2|204
10003|Stelmaria|402|3|202
10004|Javari|403|1|202
10005|Tankani|403|2|203
10006|Chandre|404|1|201
10007|Guenhwyvar|405|2|204
10008|Charlie|406|1|205
10009|Luna|406|3|205
10010|Oliver|406|2|205
10011|Smokey|407|1|206
10012|Patch|407|1|207
10013|King|404|1|204
10014|Leo|404|2|205
10015|Jiba|401|2|206
\.

COPY Members FROM stdin USING DELIMITERS '|';
1001|Leo Williams|1156 High St.|H|2/2/20|2/2/21
1002|Brad Davis|111 High St.|H|2/3/20|2/3/21
1003|Jenny Martin|111 Mission St.|H|2/4/20|2/4/21
1004|Penny Hill|100 High St.|L|2/5/20|2/5/21
1005|Joseph Wood|100 High St.|L|2/6/20|2/6/21
1006|Steven Lewis|100 High St.|L|2/7/20|2/7/21
1007|Snow Parker|111 Bay St.|H|2/8/20|2/8/21
1008|Will Smith|110 Bay St.|H|4/2/20|4/2/21
1009|Warren Elizabeth|89 Mission St.|M|5/2/20|5/2/21
\.

COPY CageVisits FROM stdin USING DELIMITERS '|';
1001|201|2/2/20|TRUE
1001|202|2/2/20|TRUE
1002|203|2/3/20|FALSE
1002|204|3/5/20|TRUE 
1003|205|3/14/20|FALSE
1007|206|3/5/20|TRUE
1007|206|3/14/20|TRUE
1007|207|4/3/20|FALSE
1005|204|3/5/20|TRUE
1005|204|4/2/20|TRUE
1008|205|4/2/20|TRUE
1008|201|4/2/20|TRUE
1008|202|4/3/20|FALSE
1009|202|4/3/20|TRUE
\.

