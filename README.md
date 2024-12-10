Welcome to my first ever DBT project! (not kidding)

# Methods
### Disclaimer
This assignment includes many things I had never done so far. On the one hand that makes it a very valuable experience for me.
On the other hand, I might have taken some shortcut to make it feasible for me to have some kind of result.

### Database
Having never set up a database from scratch, I chose a sqlite database since I thought that would be the easiest. 
Turned out this lead to a few errors/limitations later on in the project, but in the end I found a workaround.  

Limitations:
+ timestamp conversion: sqlite stores datetime values as text, see comment in `trips_clean.sql` model
+ aggregated data seemed more logical as view, so initially I had the default materialisation on 'view', 
  but Power BI was complaining about the concat function in the view query at import. I solved this by defining the 
  aggregations as table as well.

### DBT
Since I have no experience with working with DBT in practice, I stayed close to the example project setup. 
I skipped the tests to not lose too much time doing things that are new to me.

In the data cleaning step I have not filled any missing values, as the data dictionary specifies that on-scene datetime is only for accessible vehicles.
Records with negative fares are deleted as this is probably not possible. In a real situation, proper communication with business experts would probably lead 
to excluding more questionable datapoints.

For the aggregations, I calculated a trend per week instead of per month as the dataset only comprises one month.

For additional filtering options in the dashboard, I would add a time dimension table with calculated features such as 
+ day of week
+ week of year
+ weekend flag  

Same for location details, if those would be needed in multiple dashboards (now added in the dashboard).

### Dashboard
Only the 3 aggregate tables are loaded into the dashboard. At first sight this seemed fine for the requested visuals. 
However, the filters added to the dashboard are quite useless. A better way would be to either make the aggregations by hour and by location, so you can e.g. filter on location,
or to load the original (cleaned) dataset and use the automatic aggregation in Power BI visuals. This seems the most straightforward solution to me.


# Findings
### Top locations
As expected, top pickup locations include the airport zones of JFK and LaGuardia airport. Times Square also makes sense 
as a major commercial center, tourist destination and entertainment hub.
The other zones are lesser known at first glance. East village (Manhattan) might be a busy pickup location due to its active nightlife and music scene.
Crown Heights North (Brooklyn) on the other hand harbours museums, historic architecture and headquarters of several organisations.

### Trend of rides per week
The number of rides is relatively stable over a period of 4 weeks. Week 5 is lower but this is not a complete week (end of January).

### Trip miles and time by hour of day
Longest trip distances are found during nighttime hours between 3 and 6. This is not linked to longer trip times, probably due to low
traffic, although trip times do increase as morning traffic arrives. Next to that, a minimum in trip distance is observed around 8 am and 5-6 pm, 
which might indicate shorter commute trips (to and from work).

On average, trip times show a smaller peak during morning peak hours and a larger peak during afternoon peak hours. 
During nighttime hours, trip times are considerably shorter.