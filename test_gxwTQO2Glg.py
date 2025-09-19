def reverse_string(s):
    """Reverse a string."""
    return s[::-1]


def test_reverse_string():
    """Test the reverse_string function with various inputs."""
    # Test normal string
    assert reverse_string("hello") == "olleh"
    
    # Test empty string
    assert reverse_string("") == ""
    
    # Test single character
    assert reverse_string("a") == "a"
    
    # Test palindrome
    assert reverse_string("racecar") == "racecar"
    
    # Test string with spaces
    assert reverse_string("hello world") == "dlrow olleh"
    
    # Test string with special characters
    assert reverse_string("123!@#") == "#@!321"


def test_reverse_string_with_pytest():
    """Alternative test using pytest parameterization."""
    test_cases = [
        ("hello", "olleh"),
        ("", ""),
        ("a", "a"),
        ("racecar", "racecar"),
        ("hello world", "dlrow olleh"),
        ("123!@#", "#@!321")
    ]
    
    for input_str, expected in test_cases:
        assert reverse_string(input_str) == expected