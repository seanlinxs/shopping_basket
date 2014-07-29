README

## How to run the command line app
ruby main.rb path_to_input_file

The input file looks like:

    Quantity, Product, Price
    1, book, 12.49
    1, music cd, 14.99
    1, chocolate bar, 0.85
 
## How to configure classifiers
Simply add/remove item name to one of the classifier yaml files, e.g. config/food.yml

    ---
    - chocolate bar
    - imported box of chocolates
    - box of imported chocolates
