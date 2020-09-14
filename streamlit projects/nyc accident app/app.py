import streamlit as st
import pandas as pd
import numpy as np
import datetime as dt
import pydeck as pdk
import plotly.express as px
#title the web page
st.title("NYC Accident Data Representation")
st.markdown("### streamlit Dashboard!")

DATA_URL = "NYPD_Motor_Vehicle_Collisions.csv"

@st.cache(persist=True)
def load_data(DATA_URL,nrows):
    data = pd.read_csv(DATA_URL,nrows=nrows,parse_dates=[["DATE","TIME"]])
    data.dropna(subset=["LATITUDE","LONGITUDE"],inplace = True)
    #lowercase each case
    lowercase = lambda x: str(x).lower()
    data.rename(lowercase,axis=1,inplace=True)
    #data.rename(columns={"crash_date_crash_time": "date_time"},inplace=True)
    return data
data_load_state = st.text('Loading data...')
data = load_data(DATA_URL,1000)
data_load_state.text('Loading data...done!(using st.cache)')

#showing data
if st.checkbox("show raw data",False):
    st.subheader("Raw data")
    st.write(data)


#st.header("Where are the most people iunjured in NYC")

#create a histogram chart
st.header("histogram showing traffic variation in hourwise manner")
hist_values = np.histogram(
    data.date_time.dt.hour, bins=24, range=(0,24))[0]
st.bar_chart(hist_values)
st.markdown("### morning 9 am is the most busiest time in the data")

#plotting all the data
st.header("Mapping of all the data")
st.map(data)

#slider
hour_to_filter = st.slider('hour', 0, 23, 9)
filtered_data = data[data.date_time.dt.hour == hour_to_filter]
st.subheader(f'Map of all pickups at {hour_to_filter}:00')
st.map(filtered_data)

#specific questions
st.header("Where are the most people injured in NYC")
injured_people = st.slider("Number of injured",0,5,3)
st.map(data.query("`number of persons injured` >= @injured_people")[["latitude","longitude"]].dropna(how="any"))

st.header("Where are the most people killed in NYC")
killed_people = st.slider("Number of killed",0,4,0)
st.map(data.query("`number of persons killed` >= @killed_people")[["latitude","longitude"]].dropna(how="any"))


st.header("Where are the most number of pedestrians killed in NYC")
pd_killed_people = st.slider("number of pedestrians killed",0,5,3)
st.map(data.query("`number of pedestrians killed` >= @pd_killed_people")[["latitude","longitude"]].dropna(how="any"))


st.header("how many collision occured at a given time of day")
hour = st.selectbox("Hour to look at",range(0,24),1)
data_collision = data[data.date_time.dt.hour == hour]
if st.checkbox("show data",False):
    st.subheader("Raw data")
    st.write(data)

hist_values = np.histogram(
    data_collision.date_time.dt.hour, bins=24, range=(0,24))[0]
st.bar_chart(hist_values)

st.header("collision data")
hour = st.slider("Hours to look at",0,23)
data = data[data.date_time.dt.hour == hour]
st.markdown("vehicle collision between hour %i:00 and hour %i:00" % (hour,(hour+1) % 24 ))
midpoint = (np.average(data.latitude)),(np.average(data.longitude))
st.write(pdk.Deck(
                 map_style="mapbox://styles/mapbox/light-v9",
                 initial_view_state={"latitude":midpoint[0],"longitude":midpoint[1],"zoom":11,"pitch":50,},
                 layers=[
                 pdk.Layer(
                 "HexagonLayer",
                 data=data[["date_time","latitude","longitude"]],
                 get_position=["latitude","longitude"],
                 radius=100,
                 #extruded=True,
                 pickable=True,
                 #elevation_scale=4,
                 #elevation_range=[0,1000],

                 ),
                 ],

))


st.subheader("breakdown by minutes between %i:00 and %i:00" % (hour,(hour+1)%24))
filtered = data[(data.date_time.dt.hour >= hour & data.date_time.dt.hour <= (hour+1))]
hist = np.histogram(filtered.date_time.dt.minute,bins=60,range=(0,60))[0]
chart_data=pd.Dataframe({"minutes":range(60),"crashes":hist})
fig = px.bar(chart_data,x="minutes", y = "crashes",hover_data=["minutes","crashs"],height=400)

st.write(fig)


st.header("Top 5 dangerous street by affected types")
select = st.selectbox("Affected types of people",["TAXI","VAN","PASSENGER VEHICLE","LIVERY VEHICLE","OTHER"])
