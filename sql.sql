SELECT substring(charge.charge_date, 1,10) AS yyyymmdd,
       sum(CASE
               WHEN pay_type = 'credit' THEN point
               ELSE 0
           END) AS credit,
       sum(CASE
               WHEN pay_type = 'prepaid' THEN point
               ELSE 0
           END) AS prepaid,
       sum(CASE
               WHEN pay_type = 'au' THEN point
               ELSE 0
           END) AS au,
       sum(CASE
               WHEN pay_type = 'docomo' THEN point
               ELSE 0
           END) AS docomo,
       sum(CASE
               WHEN pay_type = 'bitcash' THEN point
               ELSE 0
           END) AS bitcash,
       sum(CASE
               WHEN pay_type = 'webmoney' THEN point
               ELSE 0
           END) AS webmoney,
       sum(CASE
               WHEN pay_type = 'softbank' THEN point
               ELSE 0
           END) AS softbank,
       sum(CASE
               WHEN pay_type = 'paypal' THEN point
               ELSE 0
           END) AS paypal,
       sum(CASE
               WHEN pay_type = 'conveni' THEN point
               ELSE 0
           END) AS conveni,
       sum(CASE
               WHEN pay_type = 'netbank' THEN point
               ELSE 0
           END) AS netbank,
       sum(CASE
               WHEN pay_type = 'edy' THEN point
               ELSE 0
           END) AS edy,
       sum(CASE
               WHEN pay_type = 'rakuten' THEN point
               ELSE 0
           END) AS rakuten,
       sum(CASE
               WHEN pay_type = 'atm' THEN point
               ELSE 0
           END) AS atm,
       sum(CASE
               WHEN pay_type = 'suica' THEN point
               ELSE 0
           END) AS suica,
       sum(CASE
               WHEN pay_type = 'bank' THEN point
               ELSE 0
           END) AS bank,
       sum(CASE
               WHEN pay_type = 'mobilebank' THEN point
               ELSE 0
           END) AS mobilebank,
       sum(CASE
               WHEN pay_type = 'paidy' THEN point
               ELSE 0
           END) AS paidy,
       sum(point) AS sum_point
FROM common_purchase.view_charge charge
WHERE charge.charge_date > '{{date_1}}'
  AND charge.charge_date < '{{date_2}}'
  AND account_type = 'dmmpoint'
  AND status = 'success'
  AND dt BETWEEN '{{date_1}}' AND '{{date_2}}'
GROUP BY substring(charge.charge_date, 1,10)
ORDER BY yyyymmdd DESC
LIMIT 1000
