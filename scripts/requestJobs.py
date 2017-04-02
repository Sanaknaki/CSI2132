import urllib2, sys
import json
from bs4 import BeautifulSoup
import sys
import datetime
import random
import sqlite3

conn = sqlite3.connect('../jobify/db/development.sqlite3')
cur = conn.cursor()
#search api for programmer jobs(id pk, job_description, salary, years of experience required, company fk, created_at, updated_at)
url = "http://api.glassdoor.com/api/api.htm?t.p=133980&t.k=kjtpIxrAhTc&userip=0.0.0.0&useragent=&format=json&v=1&action=jobs-prog&countryId=1&jobTitle=programmer"
hdr = {'User-Agent': 'Mozilla/5.0'}
req = urllib2.Request(url,headers=hdr)
response = urllib2.urlopen(req)
soup = BeautifulSoup(response, "html.parser")

for i in range(len(json.loads(str(soup))["response"]["results"])):
    try:
        job_id = str(i+1)
        title =  str(json.loads(str(soup))["response"]["results"][i]["nextJobTitle"])
        salary = str(json.loads(str(soup))["response"]["results"][i]["medianSalary"])
        experience = str(random.randrange(2, 10))
        company_id = str (random.randrange(1, 11))
        created_at = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        updated_at = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        print "'"+job_id+"',"   +"'"+title+"',"   +"'"+salary+"',"    +"'"+experience+"',"    +"'"+created_at+"',"    +"'"+updated_at+"',"    +"'"+company_id+"'"
        cur.execute( "INSERT INTO jobs VALUES("   +"'"+job_id+"',"   +"'"+title+"',"   +"'"+salary+"',"    +"'"+experience+"',"    +"'"+created_at+"',"    +"'"+updated_at+"',"    +"'"+company_id+"'"       +")" )
    except:
        print "----^-----insertion-is-no-go----^-----"

try:
    conn.commit()
except:
    print "commitment issues"
