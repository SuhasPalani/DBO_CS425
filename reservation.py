from faker import Faker
import random

fake = Faker()

# Create a list to store the generated data
customer_data = []
# spot_types=['standard','disabled','motor cycle','charging','valet','reserved','truck']
vehicle_types=['sedan','suv','motorcycle','Truck','Van']
from datetime import datetime, timedelta
# Define a start and end date for your timestamp range
start_date = datetime(2023, 10, 1)
end_date = datetime(2023, 12, 31)

# Generate 20 customer records
for _ in range(25):
    vehicle_id = _ + 1  # Primary key, incrementing by 1 for each record
    cust_id = random.randint(101,118)
    plate_number = random.randint(200,229)
    expire_time = start_date + timedelta(seconds=random.randint(0, (end_date - start_date).total_seconds()))
    vehicle_type = random.choice(vehicle_types)
    created_at = expire_time.strftime("%Y-%m-%d %H:%M:%S")
    customer_record = (vehicle_id,cust_id,plate_number,vehicle_type,created_at)
    customer_data.append(customer_record)

# Print the generated data
for record in customer_data:
    print(record)
    print(",")
