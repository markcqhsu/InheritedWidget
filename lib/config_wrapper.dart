import 'package:flutter/cupertino.dart';

import 'env_config.dart';

class _InheritedWidget extends InheritedWidget {
  _InheritedWidget({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final _ConfigWrapperState data;
  //_ConfigWrapperState用來儲存用來共享的變量env_config 裡面的count

  @override
  //通知頁面是否刷新, return true, 只要點擊了都刷新
  bool updateShouldNotify(_InheritedWidget oldWidget) {
    return true;
  }
}

class ConfigWrapper extends StatefulWidget {

  final EnvConfig config;

  final Widget child;

  ConfigWrapper({Key key, this.config, this.child});

  @override
  State<StatefulWidget> createState() => _ConfigWrapperState();

  //下面這段類似模板, 使用方式是固定的
  static _ConfigWrapperState of(BuildContext context) {
    final _InheritedWidget inheritedConfig =
    context.dependOnInheritedWidgetOfExactType<_InheritedWidget>();
    return inheritedConfig.data;
  }
}

class _ConfigWrapperState extends State<ConfigWrapper> {

  void incrementCounter() {
    setState(() {
      widget.config.count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedWidget(data: this, child: widget.child);
  }
}

