import random
import string
import time


def simulate_selenium_test():
    """Simulate a Selenium test that opens Google."""
    print("Simulating Selenium test...")
    print("Opening Google...")
    time.sleep(1)  # Simulate loading time
    print("Successfully opened Google!")
    print("Verifying page title...")
    time.sleep(0.5)
    print("Title verified: Google")
    print("Test completed successfully!")


def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"


if __name__ == "__main__":
    # Run the simulated Selenium test
    simulate_selenium_test()
    
    # Generate the content for the randomly named file
    script_content = '''import random
import string
import time


def simulate_selenium_test():
    """Simulate a Selenium test that opens Google."""
    print("Simulating Selenium test...")
    print("Opening Google...")
    time.sleep(1)  # Simulate loading time
    print("Successfully opened Google!")
    print("Verifying page title...")
    time.sleep(0.5)
    print("Title verified: Google")
    print("Test completed successfully!")


if __name__ == "__main__":
    simulate_selenium_test()
'''
    
    # Generate a random filename and save this script to it
    random_filename = generate_random_filename()
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to randomly named file: {random_filename}")