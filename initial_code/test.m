token = 'ffab97ae6f663e32ebf2a80da7831ef3c891ab69d1c9f18e69e7a646'; 
api = pro_api(token);
df_daily = api.query('daily', 'ts_code', '000001.SZ', 'start_date', '19990101', 'end_date', '');




dd1 = pro_bar('000001.SZ', api, '19990101', '20181031');

dd2 = pro_bar('000001.SZ', api, '19990101', '');

dd_ma1 = pro_bar('000001.SZ', api, '19990101', '', 'D', 'E', '', '', [5]);

dd_ma3 = pro_bar('000001.SZ', api, '19990101', '', 'D', 'E', '', 'qfq', [5, 10, 20]);

dd_index = pro_bar('000905.SH', api, '19990101', '', 'D', 'I');

disp(dd_ma3(1:10,:));
