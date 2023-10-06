from faker import Faker
import random

fake = Faker()

# Create a list to store the generated data
customer_data = []

# Generate 20 customer records
for _ in range(8):
    emp_id = _ + 1  # Primary key, incrementing by 1 for each record
    first_name = fake.first_name()
    last_name = fake.last_name()
    email = fake.email()
    phone_number = fake.phone_number()
    user_name = fake.user_name()
    # Generating a random password (for demonstration purposes)
    password = fake.password(length=random.randint(8, 12), special_chars=True, digits=True, upper_case=True, lower_case=True)
    
    customer_record = (emp_id, first_name, last_name, email, phone_number, user_name, password)
    customer_data.append(customer_record)

# Print the generated data
for record in customer_data:
    print(record)
    print(",")
