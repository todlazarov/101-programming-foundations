# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What does the follow method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
numbers.delete(1)

# delete_at, removes the object at the selected item, starting to count at 0, in the above example it will delete the number 2 
# delete, removes the first object that matches the selected input, in the above example it will delete the number 1 