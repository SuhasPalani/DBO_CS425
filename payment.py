from faker import Faker
import random

fake = Faker()

payment_modes=['google pay','credit','debit','wallet']
customer_data = []
payment_amts=[20,30,40,50,60,80,45,35,55,25]
payment_status=['successful','failed']

# Generate 20 customer records
for _ in range(25):
    pmt_id = _ + 500# Primary key, incrementing by 1 for each record
    log_id = random.randint(1500,1529)
    cust_id = random.randint(101,118)
    pmt_mode=random.choice(payment_modes)
    pmt_amt=random.choice(payment_amts)
    pmt_status=random.choice(payment_status)
   
    customer_record = (pmt_id,log_id,cust_id,pmt_mode,pmt_amt,pmt_status)
    customer_data.append(customer_record)

# Print the generated data
for record in customer_data:
    print(record)
    print(",")
