# -*- coding: utf-8 -*-

from google.oauth2 import service_account
import pygsheets
import json
import csv
import logging
import os

# sets logging details
#logging.basicConfig(filename="/Users/datadesk/tarbell/allentown-election-may-2019/scripts/_allentown-log.log", level=logging.INFO)

# set settings file
settings_file = open("/Users/nahusain/infrastructure/personal_client_secrets.json", "r").read()
settings = json.loads(settings_file)
creds = settings['oauth_creds']
credentials = service_account.Credentials.from_service_account_info(creds)
scoped_credentials = credentials.with_scopes(
    ['https://www.googleapis.com/auth/spreadsheets']
)

upload_row = os.environ.get('export-list')

# read CSV in
with open('/Users/datadesk/Desktop/new-votecounts.csv', 'rU') as f:
  reader = csv.reader(f, delimiter=',', quotechar='"')
  new_data = list(reader)

# instantiate pygsheets with credentials
gc = pygsheets.authorize(custom_credentials=scoped_credentials)
print('Settings set.')

# open spreadsheet with URL
sheet_url = settings['google_sheet']
sh = gc.open_by_url(sheet_url)
print('Spreadsheet active')

# activate correct sheet
tab_name = settings['results_tab']
wks = sh.worksheet_by_title(tab_name)
print('Worksheet active.')

# empty active sheet (if possible?)
wks.clear()
print('Sheet cleared. Ready for new data.')

# add dataframe to active sheet
print('Adding new votecounts...')
for candidate in new_data:
	print(candidate[10], candidate[12])
	logging.info('%s votecount is %s', candidate[10], candidate[12])

wks.append_table(values=new_data)
print('New data added.')


### DIDN'T WORK ###

# new_data = pd.read_excel('/Users/nahusain/Desktop/test-votecounts.xlsx', None)
# df = new_data.DataFrame()

# wks.update_values(crange='A1', values=new_data)
# wks.set_dataframe(new_data,(1,1))
# wks.update_values(crange='A1:M240', values=new_data)
# sh.del_worksheet(sheet_name)
# print('Old data deleted.')
# sh.add_worksheet(title='updated_results',src_worksheet='/Users/nahusain/Desktop/test-votecounts.xlsx')