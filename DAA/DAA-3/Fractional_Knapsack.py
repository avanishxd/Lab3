class Item:
    def __init__(self, value, weight):   
        self.value = value
        self.weight = weight
        self.ratio = value / weight  


def fractional_knapsack(capacity, values, weights):
    
    items = [Item(values[i], weights[i]) for i in range(len(values))]

    items.sort(key=lambda x: x.ratio, reverse=True)   
    total_value = 0.0 
    
    for item in items:
        if capacity >= item.weight:
            capacity -= item.weight
            total_value += item.value
        else:
            total_value += item.value * (capacity / item.weight)
            break  
    
    return total_value

if __name__ == "__main__":   
    values = [60, 100, 120]   
    weights = [10, 20, 30]    
    capacity = 50           
    
    max_value = fractional_knapsack(capacity, values, weights)
    print("Maximum value in Knapsack =", max_value)  
