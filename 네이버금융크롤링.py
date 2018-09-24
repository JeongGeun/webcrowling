import requests,bs4
import urllib.request as req
import urllib.parse as parse
import re
f = open('result.csv','w',encoding='utf-8')
url = 'https://finance.naver.com/sise/index.nhn'
data = req.urlopen(url).read()
html=bs4.BeautifulSoup(data,'html.parser')


table=html.find("table",{"class":"type_2"})
table2=table.findAll("td",{"class":"number"})

name=list()
for td in table2:
    name.append(td.text)
print(name)

sequence=list()
accum=list()
company=list()
price=list()
jeon=list()
deung=list()
geo=list()
si=list()
go=list()
jeo=list()
print(len(name))
i=0
while i<len(name):
    sequence.append( name[i])
    accum.append(name[i+1])
    price.append(name[i+2])
    jeon .append (name[i+3])
    deung.append(name[i+4])
    geo.append(name[i+5])
    si .append(name[i+6])
    go .append(name[i+7])
    jeo .append(name[i+8])
    i+=9
# print(sequence)

table3=table.findAll("td")
for td in table3:
    a_tag=td.find("a")
    if a_tag!=None:
        #print(a_tag.string)
        company.append(a_tag.string)
for i in range(6):
    row = '{},{},{},{},{},{},{},{},{}'.format(sequence[i],accum[i],company[i],price[i],deung[i],geo[i],si[i],go[i],jeo[i])
    print(row)
    f.write(row+"\n")
