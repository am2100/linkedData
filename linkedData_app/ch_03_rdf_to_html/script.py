#! /usr/bin/python

import rdflib
import html5lib

output = open ("output.HTML", "w")

productDBGraph = rdflib.Graph()
productDBResult = productDBGraph.parse('http://productdb.org/gtin/00681326152002.ttl', format = 'turtle')

bestBuyGraph = rdflib.Graph()
bestBuyResult = bestBuyGraph.parse('http://purl.org/net/BestBuyDarthVaderClock', format = 'rdfa')

print >>output, """<HTML>
<head>
  <title>Product Information</title>
</head>
<body>
  <table border="1">"""

print >>output, "<tr><th>Subject</th><th>Predicate</th><th>Object</th></tr>"

for sub, pred, obj in productDBGraph:
  print >>output, "<tr><td>%s</td><td>%s</td><td>%s</td></tr>" % (sub, pred, obj)

for sub, pred, obj in bestBuyGraph:
  print >>output, "<tr><td>%s</td><td>%s</td><td>%s</td></tr>" % (sub, pred, obj)

print >>output, """</table>
</body>
</HTML>"""
