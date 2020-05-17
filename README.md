# Smaller Table View Data Source
 
 Design Patterns can be quite complex to understand such as MVC and the major time developer spends in showing static list of data in a tableview and the complexity increases exponentially when we start writing implementation of 
 
``` UITableViewDataSource  ```

breaking the confusion of if else inside this method we should write a Single Data Source for each table in the whole project.

## Requirements for the implementation

### BaseListingViewModel 

This base class contains the section header and section footer height and views. 
an model which is a dictionary where key is the Section number and array is the row. 
All the logic for showing the data in a table should be made into BaseListingViewModel.
Inheriting and expanding this class functionality can be advantageous.

```
    class BaseListingViewModel: NSObject {
   
     var sectionHeaders = [Int:(UIView,CGFloat)?]()
     var sectionFooters = [Int:(UIView,CGFloat)?]()
      var model = [Int:[BaseCellViewModel]]()
    
     init(model:[Int:[BaseCellViewModel]]?,sectionHeader:[Int:(UIView,CGFloat)?]?,sectionFooter:[Int:(UIView,CGFloat)?]?) {
        self.model = model ?? [:]
        self.sectionHeaders = sectionHeader ?? [:]
        self.sectionFooters = sectionFooter ?? [:]
    }
    
    func insertFullSectionCells(section:Int, model:[BaseCellViewModel]) {
        self.model[section]  = model
    }
}
```

### Base Table View Data Source
This class contains the basic data source for the tableview. This class can be inherited and expanded according to the requirements.

```
 class BaseTableViewDataSource: NSObject,UITableViewDataSource,UITableViewDelegate {
   
    var delegate:BaseTableViewProtocol?
    var listModel:BaseListingViewModel?
    
     init(_ model:BaseListingViewModel?) {
        self.listModel = model
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        if let model = listModel?.model {
            return model.keys.count
        }
        return 0
    }
    
    // MARK:- HEADER AND FOOTER
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let tupple = listModel!.sectionHeaders[section] as? (UIView,CGFloat) {
            return tupple.0
        }
        return nil
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let tupple = listModel!.sectionHeaders[section] as? (UIView,CGFloat) {
            return tupple.1
        }
        return 0.001
    }
    
     func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let tupple = listModel!.sectionFooters[section] as? (UIView,CGFloat) {
            return tupple.0
        }
        return nil
    }
    
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if let tupple = listModel!.sectionHeaders[section] as? (UIView,CGFloat) {
            return tupple.1
        }
        return 0.001
    }
    
    // MARK:- BASIC DELEGATE AND DATA SOURCE METHODS
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let modelInsideSection = listModel?.model[section] {
            return modelInsideSection.count
        }
        return 0
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let model = listModel?.model[indexPath.section]![indexPath.row] else { return UITableViewCell() }
        if var cell = tableView.dequeueReusableCell(withIdentifier: model.reusableCellIdentifier, for: indexPath) as? BaseCellClass {
            cell.viewModel = model
            return cell as! UITableViewCell
        }
        return UITableViewCell()
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.didSelectedCell(indexPath: indexPath, viewModel: (listModel?.model[indexPath.section]![indexPath.row])!)
        }
    }
}

```

### Some Necessary Protocols

-  A cell view model must inherit BaseCellViewModel protocol
-  A controller must inherit the BaseTableViewProtocol and BaseControllerSetup protocol
-  A cell class must inherit BaseCellClass protocol


```
 protocol BaseCellClass {
    var viewModel: BaseCellViewModel? { get set }
    func initWithViewModel(viewModel: BaseCellViewModel)
}

 protocol BaseControllerSetup {
    func registerAllCellsInTableView()
    func setUpAllTheData()
}
 
protocol BaseTableViewProtocol {
    func didSelectedCell(indexPath:IndexPath,viewModel:BaseCellViewModel?);
}

 protocol BaseCellViewModel: NSObject {
    var reusableCellIdentifier: String { get set }
}

```

## Improvements

A change in data from cell to controller can be passed by viewmodels.
