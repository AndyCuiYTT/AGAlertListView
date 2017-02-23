### 选择列表:类似于 UIAlert 弹出效果
### 使用 PickerView 实现选择内容的显示,通过初始化方法传入 options 选项数组实现数据的加载.
### 完成选择后,通过点击空白或 '取消' 或 '确定' 实现选择页面消失或选中.
### 标题通过代理实现回调.

/**
 初始化对象

 @param options 列表数据
 @return 当前对象
 */
- (instancetype)initWithOptions:(NSArray<NSString*>*)options;



![输入图片说明](http://git.oschina.net/uploads/images/2017/0223/143037_341377cb_764944.png "在这里输入图片标题")