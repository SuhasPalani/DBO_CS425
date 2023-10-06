from faker import Faker
import random
from datetime import datetime, timedelta

fake = Faker()

# Create a list to store the generated data
customer_data = []
spot_types = ['standard', 'disabled', 'motor cycle', 'charging', 'valet', 'reserved', 'truck']
status_type = ['available', 'occupied']

start_date = datetime(2023, 10, 1)
end_date = datetime(2023, 12, 31)

# Generate 30 customer records
for _ in range(30):
    log_id = _ + 1500  # Primary key, incrementing by 1 for each record
    vehicle_id = random.randint(1, 25)
    spot_id = random.randint(200, 229)

    # Calculate a random checking_time within the specified date range
    checking_time = start_date + timedelta(seconds=random.randint(0, (end_date - start_date).total_seconds()))

    # Define a time window for generating a random time interval for left_at
    time_window = timedelta(minutes=random.randint(30, 180))  # Random time window between 30 and 180 minutes

    # Calculate left_at within the time window after reached_at
    left_at = checking_time + time_window

    reached_at = checking_time.strftime("%Y-%m-%d %H:%M:%S")
    left_at_str = left_at.strftime("%Y-%m-%d %H:%M:%S")
    res_id = random.randint(200, 229)

    customer_record = (log_id, vehicle_id, spot_id, reached_at, left_at_str, res_id)
    customer_data.append(customer_record)

# Print the generated data
for record in customer_data:
    print(record)
    print(",")