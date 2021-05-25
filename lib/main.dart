import 'package:flutter/material.dart';
import 'package:temp_0525/app.dart';
import 'package:temp_0525/env_config.dart';

import 'config_wrapper.dart';

void main() {
  runApp(ConfigWrapper(
      config: EnvConfig(),
      child: MyApp())
  );
}



