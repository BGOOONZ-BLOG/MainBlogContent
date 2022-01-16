from lxml import etree
import json
from rdflib import Graph, Namespace
from rdflib.namespace import NamespaceManager

namespaces = {
              'oa' : Namespace('http://www.w3.org/ns/oa#'),
              'dc' : Namespace('http://purl.org/dc/elements/1.1/'),
              'dcterms' : Namespace('http://purl.org/dc/terms/'),
              'dctypes' : Namespace('http://purl.org/dc/dcmitype/'),
              'owl' : Namespace('http://www.w3.org/2002/07/owl#'),
              'rdf' : Namespace('http://www.w3.org/1999/02/22-rdf-syntax-ns#'),
              'rdfs' : Namespace('http://www.w3.org/2000/01/rdf-schema#'),
              'skos' : Namespace('http://www.w3.org/2004/02/skos/core#'),
              'foaf' : Namespace('http://xmlns.com/foaf/0.1/'),
              'prov' : Namespace('http://www.w3.org/ns/prov#'),
              'xsd' : Namespace('http://www.w3.org/2001/XMLSchema#'),
              'sioc' : Namespace("http://rdfs.org/sioc/ns#")}

pfxs = []

for (key,val) in namespaces.copy().iteritems():
	pfxs.append("@prefix %s: <%s> ." % (key, val))
pfxstr = '\n'.join(pfxs)

dom = etree.parse('index-respec.html', etree.HTMLParser())
egs = dom.xpath('//pre[@class="example highlight"]')

x = 0

for eg in egs:
	egdata = eg.xpath('./text()')[0]
	if egdata.strip()[0] == '{':
		x += 1  # Only do this once per example!
		# JSON-LD
		try:
			json.loads(egdata)
			fh = file("examples/correct/anno%s.json" % x, 'w')
			fh.write(egdata)
			fh.close()
		except:
			print "Busted: " + eg.xpath('@title')[0]
			print egdata
	else:	
		# Turtle
		g = Graph()
		data = pfxstr + "\n\n" + egdata
		try:
			g.parse(data=data, format="turtle")
			fh = file("examples/correct/anno%s.ttl" % x, 'w')
			fh.write(data)
			fh.close()
		except:
			print "Busted: " + eg.xpath('@title')[0]
			print egdata
			print "\n\n"
