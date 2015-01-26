# simpleScrollingVerticalCellList
A very rough and basic sample iOS app showing table style cell layout with constraints and a standalone scrollview.

The is a very rough draft demo app showing how to get an effect similar to a UITableVIew or UICollectionView but using autolayout
for the flow. It also shows autoresizing of the individual cells with animation. It does not show the customCell interfacing with a model object.
Nor does it implement any of the features of the standard UITableView and UICollectionView such as selection highlighting, addition, deletion, ...

This demo also uses the technique of setting the width of UIScrollView content by creating an autolayout reference from a UIScrollView
container view to a super view of the UIScrollView. The independent variable of each cell is the UITextView height which is set to 
a random value on loading and can be changed to a new random value by clicking the randomize button.

This is an initial commit and done in a couple of hours so it is still severely lacking in documentation. 

Basically, the controller tells the cells container to perform a layout. The container adds and lays out the cells with the desired constraints. 
The cell creates and modifies a height constraint for the textView height. Changes to the textView height flags setNeedsLayout.

This technique is not recommended for long lists of cells where the caching and re-use of cells implemented by the standard UICollectionView is much more appropriate.
