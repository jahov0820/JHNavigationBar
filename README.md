# JHNavigationBar

##Screenshot

![alt tag](https://github.com/Liaojiahao/JHNavigationBar/blob/master/screenshoot1.gif)
![alt tag](https://github.com/Liaojiahao/JHNavigationBar/blob/master/screenshoot2.gif)

##Usage

```
 override func viewDidLoad() {
        super.viewDidLoad()


        // case1:
        var color = UIColor(red: 25/255, green: 144/255, blue: 211/255, alpha: 1)
        self.navigationController?.navigationBar.overlayColor = color

    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        // case2:
//        self.navigationController?.navigationBar.jh_heightReset()

        // case1:
        self.navigationController?.navigationBar.jh_alphaReset()
    }

    override func viewWillAppear(animated: Bool) {
        //need
        self.scrollViewDidScroll(tableView)
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
//         case1:
        JHNavBarHandle.handleJHNavigationBarAlpha(scrollView, uiviewcontoller: self)


        //case2:
//        JHNavBarHandle.handleJHNavigationBarHeight(scrollView, uiviewcontoller: self)

    }
```

## CocoaPods

> pod 'JHNavigationBar', '~> 1.1.0'
