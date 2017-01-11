# LFY_UITablViewBublleView
在获取Cell中控件相对于UIControllerView的位置，借助了UIView中的方法

- (CGRect)convertRect:(CGRect)rect toView:(nullable UIView *)view;
获取当前Cell的位置可使用一下方法：

CGRect contentViewRect = [tableView rectForRowAtIndexPath:indexPath];   
CGRect rect = [tableView contentViewRect toView:[tableView superview]];
方法介绍http://stackoverflow.com/questions/687793/determine-coordinates-of-a-uitableviewcell-while-scrolling
获取控件的位置：

UITableViewCell *cell = [_tableView cellForRowAtIndexPath:sender.indexPath];
BBBButton *btn = [cell.contentView viewWithTag:104];
btn.selected = !btn.selected;
CGRect rect = [cell.contentView convertRect:btn.frame toView:self.view];
弹出气泡是在当前Window上增加了一层透明的UIView

  UIView *keywindow = [[UIApplication sharedApplication] keyWindow];
  keywindow addSubview:tipsView];
效果图如下：

![Upload UItableView.gif failed. Please try again.]

Demo地址:https://github.com/JnLuffy/LFY_UITablViewBublleView
![image](https://github.com/JnLuffy/LFY_UITablViewBublleView/blob/master/LFY_UITablViewBublleView/UItableView.gif)
