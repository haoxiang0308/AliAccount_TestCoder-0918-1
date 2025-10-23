def reverse_string(s):
    """Function to reverse a string."""
    return s[::-1]

def test_reverse_string():
    """Pytest function to test string reversal."""
    # Test with a normal string
    assert reverse_string("hello") == "olleh"
    
    # Test with an empty string
    assert reverse_string("") == ""
    
    # Test with a single character
    assert reverse_string("a") == "a"
    
    # Test with a palindrome
    assert reverse_string("racecar") == "racecar"
    
    # Test with numbers and special characters
    assert reverse_string("12345") == "54321"
    assert reverse_string("!@#$%") == "%$#@!"
    
    print("All tests passed!")

if __name__ == "__main__":
    test_reverse_string()