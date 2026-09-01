/ Small, fully deterministic tables shared by the table and time-series
/ exercises. Hand-written rather than generated so that every expected
/ value in the tests is stable.

trade:([]
  time :09:30:00.000 09:30:05.000 09:30:10.000 09:31:00.000 09:31:30.000 09:32:00.000 09:32:15.000 09:33:00.000;
  sym  :`AAPL`MSFT`AAPL`AAPL`MSFT`GOOG`AAPL`MSFT;
  price:100.0 200.0 101.0 102.0 201.0 300.0 103.0 199.0;
  size :100 200 150 300 250 50 400 350i);

quote:([]
  time:09:29:00.000 09:30:02.000 09:30:08.000 09:31:00.000 09:32:00.000 09:32:30.000;
  sym :`AAPL`AAPL`MSFT`AAPL`GOOG`MSFT;
  bid :99.5 100.5 199.5 101.5 299.5 198.5;
  ask :100.5 101.5 200.5 102.5 300.5 199.5);

/ `fay` works in `legal`, which is deliberately missing from `dept` --
/ that is what makes a left join and an inner join behave differently.
emp:([]
  name:`ann`bob`cara`dan`eve`fay;
  dept:`eng`eng`sales`sales`eng`legal;
  salary:120 110 90 95 130 105;
  start:2019.01.15 2020.03.01 2018.07.10 2021.11.20 2017.02.28 2022.05.09);

dept:([dept:`eng`sales`hr] boss:`kim`lee`mo; level:3 2 1);
