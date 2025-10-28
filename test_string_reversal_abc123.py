import pytest

def reverse_string(s):
    """Function to reverse a string."""
    return s[::-1]

def test_string_reversal():
    """Test function for string reversal."""
    # Test normal string
    assert reverse_string("hello") == "olleh"
    
    # Test single character
    assert reverse_string("a") == "a"
    
    # Test empty string
    assert reverse_string("") == ""
    
    # Test palindrome
    assert reverse_string("racecar") == "racecar"
    
    # Test string with spaces
    assert reverse_string("hello world") == "dlrow olleh"
    
    # Test string with numbers
    assert reverse_string("12345") == "54321"
    
    # Test special characters
    assert reverse_string("!@#$%") == "%$#@!"

if __name__ == "__main__":
    pytest.main()