import requests
import pandas as pd


if __name__ == "__main__":
    url = "http://datastore.or.kr:5000/api/action/datastore_search_sql?sql=SELECT * from \"88260b98-a625-4b1a-b295-8d71433e7cab\" WHERE to_char(등록날짜, 'YYYY-MM-DD') >= '2017-03-01'"
    response = requests.get(url)
    json = response.json()['result']['records']
    df = pd.DataFrame.from_dict(json, orient='columns')
    df.drop('_full_text', 1)
    df.replace('\s+', ' ', regex=True, inplace=True)
    df.to_csv('useditem.csv', index_label='ID')
