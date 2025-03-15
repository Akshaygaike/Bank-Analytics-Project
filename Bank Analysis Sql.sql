Create Database Bankanalytics;
use Bankanalytics;

Select * from finance_1;
Select * from finance_2;
Drop table Finance_1;

Select Year(issue_d) as issuedate,Sum(loan_amnt) as TotalAmount
From Finance_1
Group by loan_amnt,issue_d;

 
Select grade,sub_grade,Sum(revol_bal) as Revolvingbalance
From Finance_1 as f1
Inner Join Finance_2 as f2
on f1.id = f2.id
Group by grade,sub_grade
Order by grade;

Select Verification_status,Concat("$",Format(round(Sum(total_pymnt)/1000000,2),2),"M") as TotalPayment
From Finance_1 as f1
Join Finance_2 as f2
on f1.id = f2.id
Group by Verification_status;

Select last_pymnt_d as lastpaymentdate,home_ownership,Concat("$",Format(round(Sum(total_pymnt)/1000000,2),2),"M") as TotalPayment
From Finance_1 as f1
join Finance_2 as f2
on f1.id = f2.id
Group by last_pymnt_d,home_ownership;


Select addr_state,last_credit_pull_d, loan_status
From Finance_1 as f1
Join Finance_2 as f2
On f1.id = f2.id
Order by addr_state;


