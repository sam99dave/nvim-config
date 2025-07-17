import random

#TODO: todo
#NOTE: note
#WARNING: warning
#Just a comment
def func(a, b):
    """
    Add two numbers.
    
    Args:
        a: First number to add
        b: Second number to add
        
    Returns:
        The sum of a and b
    """
    random.randint(2, 2)
    return a + b


def add(x, y):
    """
    Add two numbers.
    Args:
        x: First number to add
        y: Second number to add
        
    Returns:
        The sum of x and y
    """

    return x + y

if __name__ == "__main__":    
    # Test the function
    result = func(2, 3)
    print(f"The sum is: {result}")
    
    
    


