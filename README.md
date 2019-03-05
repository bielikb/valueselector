# valueselector
ValueSelector provides abstraction that self-contains logic for single selection

`ValueSelector` abstraction is declared as abstraction capable of handling your signle selection logic.


### Motivation
While working on single selection logic, we tend to leave the logic around selecting a single value or reading the current selected index in classes.
While leaving this logic in your `ViewController`, `ViewModel` and similar doesn't cause much of a harm, it lacks the single responsibility principle.

`ValueSelector` protocol declares simple and reusable pattern for the single selection you're about to declare in your app.
It gives you the managment of selected indexes, values, and other useful accessors for free. Thus acts as a good datasource solution for your most general use cases.
To instantiate you only need to provide all possible values and selected index (optional).


## Usage
Usage can be seen in `Sample App` in this repo.

```
struct ColorSelector: FormattedValueSelector {
    var formattedValues: [String] {
        return values.map { $0.description }
    }

    var formattedSelectedValue: String {
        return selectedValue?.description ?? "No color selected"
    }

    static var emptyValue = UIColor.clear

    let values: [UIColor]
    var selectedValue: UIColor?

    init?(values: [UIColor], selectedValue: UIColor?) {
        self.values = values
        self.selectedValue = selectedValue
    }
}
```

# Changing the selected value by index
`colorSelector.selectValue(at: index)`

# Changing the selected value
`colorSelector.selectValue(value)`

# Accessing the value by index
`colorSelector.value(at: index)` || `colorSelector[index]`

## Contribution
Pull requests are welcome.
