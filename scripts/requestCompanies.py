import urllib2, sys
import json
from bs4 import BeautifulSoup
import psycopg2
import sys
import datetime


#setup connection
try:
    conn = psycopg2.connect(dbname="dd37lpbldljtle", user="rzttticiuczhxy", host="ec2-54-221-244-196.compute-1.amazonaws.com", port="5432", password="1382bb0ab76347a000ab4c01482fd99b9c02ffc22705e682d5fbd44bec04ed38", sslmode="allow")
    cur = conn.cursor()
except psycopg2.Error as e:
    print e


#search api for engineeing companies(id,name,sector,rating,website,created_at,updated_at)
url = "http://api.glassdoor.com/api/api.htm?t.p=133980&t.k=kjtpIxrAhTc&userip=8.28.178.133&useragent=Mozilla&format=json&v=1&action=employers&q=engineering"
hdr = {'User-Agent': 'Mozilla/5.0'}
req = urllib2.Request(url,headers=hdr)
response = urllib2.urlopen(req)
soup = BeautifulSoup(response, "html.parser")

for i in range(len(json.loads(str(soup))["response"]["employers"])):
    try:
        print   json.loads(str(soup))["response"]["employers"][i]["name"] + "\t\t" + json.loads(str(soup))["response"]["employers"][i]["overallRating"] + "\t\t" + json.loads(str(soup))["response"]["employers"][i]["website"] + "\t\t" + json.loads(str(soup))["response"]["employers"][i]["sectorName"]
        name = str(json.loads(str(soup))["response"]["employers"][i]["name"])
        sector = str(json.loads(str(soup))["response"]["employers"][i]["sectorName"])
        website = str(json.loads(str(soup))["response"]["employers"][i]["website"] )
        rating = str(json.loads(str(soup))["response"]["employers"][i]["overallRating"])
        created_at = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        updated_at = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        company_id = str(i+1)
        cur.execute("INSERT INTO companies VALUES("   +"'"+company_id+"',"   +"'"+name+"',"   +"'"+sector+"',"    +"'"+rating+"',"    +"'"+website+"',"    +"'"+created_at+"',"    +"'"+updated_at+"'"        +")")
    except:
        print "----^-----insertion-is-no-go----^-----"

try:
    conn.commit()
except:
    print "committment issues"

    
'''
#Retail
url = "http://api.glassdoor.com/api/api.htm?t.p=133980&t.k=kjtpIxrAhTc&userip=8.28.178.133&useragent=Mozilla&format=json&v=1&action=employers&q=retail"
hdr = {'User-Agent': 'Mozilla/5.0'}
req = urllib2.Request(url,headers=hdr)
response = urllib2.urlopen(req)
soup = BeautifulSoup(response, "html.parser")

for i in range(len(json.loads(str(soup))["response"]["employers"])):
    try:
        print   json.loads(str(soup))["response"]["employers"][i]["name"] + "\t\t" + json.loads(str(soup))["response"]["employers"][i]["overallRating"] + "\t\t" + json.loads(str(soup))["response"]["employers"][i]["website"] + "\t\t" + json.loads(str(soup))["response"]["employers"][i]["sectorName"]
        name = str(json.loads(str(soup))["response"]["employers"][i]["name"])
        sector = str(json.loads(str(soup))["response"]["employers"][i]["sectorName"])
        website = str(json.loads(str(soup))["response"]["employers"][i]["website"] )
        rating = str(json.loads(str(soup))["response"]["employers"][i]["overallRating"])
        created_at = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        updated_at = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        company_id = str(i+1)
        cur.execute("INSERT INTO companies VALUES("   +"'"+company_id+"',"   +"'"+name+"',"   +"'"+sector+"',"    +"'"+rating+"',"    +"'"+website+"',"    +"'"+created_at+"',"    +"'"+updated_at+"'"        +")")
    except:
        print "----^-----insertion-is-no-go----^-----"

try:
    conn.commit()
except:
    print "committment issues"

    

#Education
url = "http://api.glassdoor.com/api/api.htm?t.p=133980&t.k=kjtpIxrAhTc&userip=8.28.178.133&useragent=Mozilla&format=json&v=1&action=employers&q=education"
hdr = {'User-Agent': 'Mozilla/5.0'}
req = urllib2.Request(url,headers=hdr)
response = urllib2.urlopen(req)
soup = BeautifulSoup(response, "html.parser")

for i in range(len(json.loads(str(soup))["response"]["employers"])):
    try:
        print   json.loads(str(soup))["response"]["employers"][i]["name"] + "\t\t" + json.loads(str(soup))["response"]["employers"][i]["overallRating"] + "\t\t" + json.loads(str(soup))["response"]["employers"][i]["website"] + "\t\t" + json.loads(str(soup))["response"]["employers"][i]["sectorName"]
        name = str(json.loads(str(soup))["response"]["employers"][i]["name"])
        sector = str(json.loads(str(soup))["response"]["employers"][i]["sectorName"])
        website = str(json.loads(str(soup))["response"]["employers"][i]["website"] )
        rating = str(json.loads(str(soup))["response"]["employers"][i]["overallRating"])
        created_at = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        updated_at = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        company_id = str(i+1)
        cur.execute("INSERT INTO companies VALUES("   +"'"+company_id+"',"   +"'"+name+"',"   +"'"+sector+"',"    +"'"+rating+"',"    +"'"+website+"',"    +"'"+created_at+"',"    +"'"+updated_at+"'"        +")")
    except:
        print "----^-----insertion-is-no-go----^-----"

try:
    conn.commit()
except:
    print "committment issues"
'''
